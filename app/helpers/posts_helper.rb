module PostsHelper
  def markdownHelper(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    return markdown.render(text).html_safe
  end
end
