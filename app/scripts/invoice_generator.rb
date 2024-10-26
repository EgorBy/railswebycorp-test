# frozen_string_literal: true

require 'stripe'
require_relative '../lib/fakestoreapi_service/client'

# `InvoiceGenerator` используется для бизнес логики
module InvoiceGenerator
  class << self
    def call
      Stripe.api_key = Rails.application.config_for(:settings)['stripe']['api_key']
      logger = Rails.logger

      client = FakeStoreAPIService::Client.new
      carts = JSON.parse(client.fetch_carts)

      carts.each do |cart|
        create_invoice_for_cart(cart, client, logger)
      end
    end

    private

    def create_invoice_for_cart(cart, client, logger)
      # Логика создания клиента, продукта и инвойса в Stripe -выполню потом
    end
  end
end