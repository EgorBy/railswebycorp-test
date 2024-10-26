# frozen_string_literal: true

module FakeStoreAPIService
  # `FakeStoreAPIService::Client` используется для взаимодействия с Fake Store API.
  # Предоставляет методы для получения корзин, пользователей и продуктов.
  class Client
    BASE_URL = 'https://fakestoreapi.com'

    def initialize
      @connection = Faraday.new(url: BASE_URL)
    end

    def fetch_carts
      @connection.get('/carts').body
    end

    def fetch_user(user_id)
      @connection.get("/users/#{user_id}").body
    end

    def fetch_product(product_id)
      @connection.get("/products/#{product_id}").body
    end
  end
end