# frozen_string_literal: true

# application_helper.rb or an appropriate helper module
# Comment
module ApplicationHelper
  def render_card_for_item(item)
    render partial: 'components/item-card', locals: { item: }
  end
end
