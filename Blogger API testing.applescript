(* ==== Blogger API Tester script ==== *)
-- Created By: Tim Conner
-- http://www.objectivelabs.com/
-- Version -.2
-- July 19, 2002

(* ==== About this script ====
This script was written for builders of Blogger api's to test how applescript and more
importantly the OS X xmlrpc library will interpret the results they are returning.
A great debugging tool.
 *)

(* ==== How to use this script ====
 Uncomment the lines in the "on run" portion of the script individually to test each function.
Be sure to specify your properties accurately below. To view the results select "Show Result:" 
form the controls menu of script Editor. To view it step by step choose "open event log" from
the controls menu in script editor. The relult will show as a list of items as the Mac OS X
implimentation of XML-RPC interprets them.
 *)

(* ==== Properties ==== *)
property appkey : "4FCE1E1F9E2DC89044F09D583390AB8A36F4903E" -- my appkey code to blogger backend
property username : "username" -- your username
property myPassword : "password" -- your password
property apiurl : "http://plant.blogger.com/api/RPC2" -- the complete api url
property blogid : "1" -- Id of the weblog you'd like to post to
property content : "This is a test post" -- content of the post
property noOfPosts : 1 -- the number of posts to return for get recent posts. must be integer
property templateType : "main" -- main or archive
property template : "This is my new blogger template" --the template you want to send to your server 
property postid : "246" --id of post to edit. Must be in quotes
property publish : true -- set default publish property (it may be overridden by the function [see delete post])


on run
	(* un comment each line individually to test each functions results *)
	set theResult to getUsersBlogs(username, myPassword)
	--getUserInfo(username, myPassword)
	--newPost(blogid, content, publish)
	--editPost(postid, content, publish)
	--deletePost(postid)
	display dialog blogname of theResult
	
	--getRecentPosts(blogid, username, myPassword, noOfPosts)
	--getTemplate(blogid, templateType)
	--setTemplate(blogid, template, templateType)	
end run


(* ==== You shouldn't have to edit below this line ====*)

-- Sends the XML-RPC code to the remote server
on tellBloggerAPI(methodName, params)
	using terms from application "http://www.apple.com"
		-- any url works here. Fools applescript into using xml-rpc terms
		tell application (apiurl as text)
			set myResult to call xmlrpc {method name:methodName, parameters:{appkey} & params}
			return myResult
		end tell
	end using terms from
end tellBloggerAPI


-- Returns a list of blogs owned by a given user.
on getUsersBlogs(username, thePassword)
	set params to {username, thePassword}
	return tellBloggerAPI("blogger.getUsersBlogs", params)
end getUsersBlogs

-- Creates a new post, and possibly it is published
on newPost(blogid, content, publish)
	set params to {blogid, username, myPassword, content, publish}
	return tellBloggerAPI("blogger.newPost", params)
end newPost

-- replaces the contents of the specified post with the content variable
on editPost(postid, content, publish)
	set params to {postid, username, myPassword, content, publish}
	return tellBloggerAPI("blogger.editPost", params)
end editPost

-- deletes the post of the specified post id
on deletePost(postid)
	set publish to true -- so it automatically publishes your delete
	set params to {postid, username, myPassword, publish}
	return tellBloggerAPI("blogger.deletePost", params)
end deletePost

-- returns the contents of the template of the type specified
on getTemplate(blogid, templateType)
	set params to {blogid, username, myPassword, templateType}
	return tellBloggerAPI("blogger.getTemplate", params)
end getTemplate

-- saves the specified template with the contents of the template variable
on setTemplate(blogid, template, templateType)
	set params to {blogid, username, myPassword, template, templateType}
	return tellBloggerAPI("blogger.setTemplate", params)
end setTemplate

-- returns the contents of the number of posts specified. Many api's return all of the posts if a number is not specified
on getRecentPosts(blogid, username, myPassword, noOfPosts)
	set params to {blogid, username, myPassword, noOfPosts}
	return tellBloggerAPI("blogger.getRecentPosts", params)
end getRecentPosts

on getUserInfo(username, myPassword)
	set params to {username, myPassword}
	return tellBloggerAPI("blogger.getUserInfo", params)
end getUserInfo
