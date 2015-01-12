# This is very simple. Implement a Blog class where you can add 
# Post objects. Each post will have a title, a date and a text. 
# Then add a front_page method at Blog that returns the front 
# page of the blog in the following format:

class Blog
	def initialize
		@posts = []
	end
	private
		def advertise(post)
			if post.is_sponsored
				return '*'*5+post.title+'*'*5
			else
				return post.title
			end
		end
	public
	def front_page
		@posts.reduce("") do |result,item|
		  result += 
		  "#{advertise(item)}\n#{'*' * 20}\n#{item.text}\n#{'-' * 20}\n"
		end
	end
	def add_post(post)
		@posts << post
	end
end

class Post
	attr_reader :title, :date, :text, :is_sponsored
	def initialize (title, date, text, is_sponsored = false)
		@title = title
		@data = date
		@text = text
		@is_sponsored = is_sponsored
	end
end

############ main
blog = Blog.new
blog.add_post(
	Post.new("my first post","01/01/2015","Lorem ipsum dolor sit amet"))
blog.add_post(
	Post.new("my second post","01/02/2015","En un lugar de La Mancha",true))
blog.add_post(
	Post.new("Crazy one","01/02/2015","Sed ut perspiciatis unde omnis iste natus error"))
puts blog.front_page