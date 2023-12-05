# frozen_string_literal: true
# application_helper.rb or an appropriate helper module
require 'CardFactory'

module ApplicationHelper
  def render_card_for_item(item)
    card = CardFactory.create_card(item)
    render partial: 'components/item-card', locals: { item:, card: }
  end
end

