## The Source
I found a wonderful guide on Scaffold by K Hong you can find [here](http://www.bogotobogo.com/RubyOnRails/RubyOnRails_Blog_with_post_and_comment.php).

## Markdown Rendering
[Redcarpet](https://github.com/vmg/redcarpet) handles turning markdown text into HTML, which goes into embedded ruby templating engine (.erb).

In _posts_helper.rb_:

```
module PostsHelper
  def markdownHelper(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    return markdown.render(text).html_safe
  end
end
```

In _show.html.erb_ :

```
<%= markdownHelper @post.body %>
```

## Markdown Editing
[md_simple_editor](https://github.com/rderoldan1/md_simple_editor) by rderoldan1 loads in a better text-area that includes build-in markdown editing tools. Neat! 

I had to fork and edit their repo to add in a CSRF work-around for md_simple_editor which you can find [here](https://github.com/mattlgroff/md_simple_editor)

In __form.html.erb_:

```
    <div>
      <%= form.label :body %>
      <div class="form-group">
        <%= md_simple_editor  do %>
          <%= form.text_area :body, id: :post_body %>
        <% end %>
      </div>
    </div>
```
