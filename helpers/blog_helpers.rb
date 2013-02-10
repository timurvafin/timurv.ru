module BlogHelpers
  def title
    current_page.data.title || yield_content(:title)
  end

  def date(time)
    Russian::strftime(time, '%d %b %Y')
  end

  def tags(page)
    page.tags.map { |tag| link_to(tag, tag_path(tag)) }.join(', ')
  end

  def related(page)
    all_pages = blog.tags.slice(*page.tags).values.first
    return [] if all_pages.blank?

    all_pages.delete_if { |p| p == page }
  end
end
