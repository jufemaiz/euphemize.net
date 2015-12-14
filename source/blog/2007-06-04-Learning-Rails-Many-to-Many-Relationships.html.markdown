---
title: 'Learning Rails: Many-to-Many Relationships'
date: '2007-06-04 14:25:03'
tags:
- code
- has_many
- many-to-many-relationship
- programming
- rails
- ruby
- ruby-on-rails
- through
- tutorial
---

<div class="note"><p>To anyone who finds this tutorial useful I'd love some feedback or example implementations. Just leave a note at the bottom :)</p></div>
So I've had the books in my possession for almost a year now, and I've been picking at it when I've had time and am part way through a "small" project called <a href="http://brewr.org">brewr</a>. As I needed something with a little less degree of difficulty I've decided to develop the backend of <a href="http://jc-photo.net">jc-photo.net</a> by hand myself and am using the new kid on the block, coding wise, Ruby on Rails. There's plenty of history <a href="http://www.google.com/search?q=ruby+on+rails+history">already written</a> on the group behind it (<a href="http://37signals.com/">37Signals</a>). Anyhow, on with the show.
<h3>Many to Many Relationships with Details</h3>
<blockquote><q>No, we're not talking about polygamy here, but rather the issues surrounding with linking models together.</q></blockquote>
Obviously with almost every database model you will be looking to link various bits of disparate data in different tables together. With <acronym title="Ruby on Rails">RoR</acronym> you have a number of options. There's the <code>has_and_belongs_to_many</code> option, however as a join table this is limited as it gives no option for additional details about that join. Enter <code>has_many :through</code> (and it even has a <a href="http://blog.hasmanythrough.com/">blog dedicated to it</a>!). Why is this important? Well, imagine you want to replicate <a href="http://flickr.com">flickr</a>'s image functionality with tagging, sets and collections.
<h4>The Model</h4>
Obviously there are a set of relationships. In <acronym title="Ruby on Rails">RoR</acronym> this could be represented, taking into account a desire to order your sets in collections and images in your sets, by:
<pre>class Image &lt; ActiveRecord::Base
  has_many  :taggings,:dependent =&gt; true
  has_many  :tags, :through =&gt; :taggings, :uniq =&gt; true

  has_many  :imagesets,:dependent =&gt; true
  has_many  :sets, :through =&gt; :imagesets, :uniq =&gt; true
end</pre>
<pre>class Set &lt; ActiveRecord::Base
  has_many  :imagesets,:dependent =&gt; true
  has_many  :images, :through =&gt; :imagesets, :uniq =&gt; true

  has_many  :setcollections, :dependent =&gt; true
  has_many  :collections, :through =&gt; :setcollections, :uniq =&gt; true
end</pre>
<pre>class Collection &lt; ActiveRecord::Base
  has_many  :setcollections, :dependent =&gt; true
  has_many  :collections, :through =&gt; :setcollections, :uniq =&gt; true
end</pre>
<pre>class Tagging &lt; ActiveRecord::Base
  belongs_to  :image
  belongs_to  :tag
end</pre>
<pre>class Imageset &lt; ActiveRecord::Base
  belongs_to    :image
  belongs_to    :set
  acts_as_list  :scope =&gt; :sets
end</pre>
<pre>class Setcollection &lt; ActiveRecord::Base
  belongs_to  :set
  belongs_to  :collection
end</pre>
If we look at the case of images in a set by itself, for ease of this write up, we need to add a little handler in there (you'll see why in a bit). This is due to the desire to add an ordering component to our models. This would then alter, slightly, the models to this:
<pre>class Image &lt; ActiveRecord::Base
  has_many  :taggings,:dependent =&gt; true
  has_many  :tags, :through =&gt; :taggings, :uniq =&gt; true

  has_many  :imagesets,:dependent =&gt; true
  has_many  :sets, :through =&gt; :imagesets, :uniq =&gt; true
end</pre>
<pre>class Set &lt; ActiveRecord::Base
  has_many  :imagesets,:dependent =&gt; true
  has_many  :images, :through =&gt; :imagesets, :uniq =&gt; true

  has_many  :setcollections, :dependent =&gt; true
  has_many  :collections, :through =&gt; :setcollections, :uniq =&gt; true

  def image_ids=(image_ids)
    image_ids.map!(&amp;:to_i)
    setcollections.each do |setcollection|
      setcollection.destroy unless image_ids.include?setcollection.gallery_id
    end
    image_ids.each do |image_id|
      self.setcollections.create(:image_id =&gt; image_id, :position =&gt; self.setcollections.length) unless setcollections.any?{ |sc| sc.image_id == image_id }
    end
  end
end</pre>
<pre>class Imageset &lt; ActiveRecord::Base
  belongs_to    :image
  belongs_to    :set
  acts_as_list  :scope =&gt; :sets
end</pre>
<h4>The Controller</h4>
So now we have our relationships set up, we need to be able to, say, tag an image with tags. Let us assume that it is done on the editing phase for ease of an example.
<pre>def edit_set
  @set = Set.find(params[:id])
  @images = Image.find(:all, :order =&gt; "name")
end</pre>
We grab all the images (though there may be better ways of handling this part in the long term) in addition to the actual set that we are looking at.
<pre>def update_set
  params[:set][:image_ids] ||= []
  @set = Set.find(params[:id])

  if @set.update_attributes(params[:set])
    @set.save
    flash[:notice] = "Set was susccessfully updated."
    redirect_to :action =&gt; 'view_set', :id =&gt; @set
  else
    render :action =&gt; 'edit_set', :id =&gt; @set
  end
end</pre>
The reason why we defined the function <code>image_ids</code> in the <code>Set model</code> is so that we can use the <code>params[:set][:image_ids]</code> to add or delete image references in the join table. When new ones are added, they are added at the end of the <code>acts_as_list</code> list. The catch here is that you need to force the items in the <code>image_ids</code> array to be integers, not strings (as is passed by the <acronym title="hypertext markup language">html</acronym> form). This turned out to be a major debug point for me due to a background in PHP, with it's rather lax type strictness.
<h4>The View</h4>
Now we need only cycle through the images for the check boxes, pre-checking where an existing join occurs (using the third boolean argument of check_box_tag <code>@set.images.include?(image)</code>). The update phase also takes care of the ordered nature of our set, with new images added after existing. You can then use the methodology well described to move the image reference up or down for each gallery.
<pre>&lt;ul&gt;
&lt; % for image in @images %&gt;
  &lt;li&gt;
    &lt; %= check_box_tag "set[image_ids][]", image.id, @set.images.include?(image) %&gt;
    <label>&lt; %= h image.name %&gt;</label>
  &lt;/li&gt;
&lt; % end %&gt;
&lt;/ul&gt;</pre>
<h3>Conclusion</h3>
It took me some time to get to this point, with a major stumbling block being Ruby's more strict method of ensuring variable types are treated differently - namely a string of <code>1</code> is not equivelant to an integer <code>1</code>.
<h3><ins>Update</ins></h3>
Andrew was asking about the schema for the database tables, so I'll add in the migrate details.

<strong>@Andrew:</strong> I will be writing up anything I find useful that I can't find assistance with on the web.

In terms of a migration for the tables, it would look something like this (I'll update in the post too):
<pre>class CreateImages &lt; ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column :name, :string, :null =&gt; false
      t.column :permalink, :string, :null =&gt; false
      t.column :description, :text, :null =&gt; false
      t.column :filename, :text, :null =&gt; false
    end
  end

  def self.down
    drop_table :images
  end
end</pre>
<pre>class CreateSets &lt; ActiveRecord::Migration
  def self.up
    create_table :sets do |t|
      t.column :name, :string, :null =&gt; false
      t.column :permalink, :string, :null =&gt; false
      t.column :description, :text, :default =&gt; nil
    end
  end

  def self.down
    drop_table :sets
  end
end</pre>
and the complex join table
<pre>class CreateImagesets &lt; ActiveRecord::Migration
  def self.up
    create_table :imagesets do |t|
      t.column :position, :int, :null =&gt; false
      t.column :gallery_id, :int, :null =&gt; false
      t.column :image_id, :int, :null =&gt; false
    end

    execute "alter table imagesets add foreign key (set_id) references sets(id)"
    execute "alter table imagesets add foreign key (image_id) references images(id)"

  end

  def self.down
    drop_table :imagesets
  end
end</pre>
