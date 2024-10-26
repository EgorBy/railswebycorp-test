# frozen_string_literal: true

module FakeStoreAPIService
  # `FakeStoreAPIService::Client` используется для взаимодействия с Fake Store API
  # Предоставляет методы для получения корзин, пользователей и продуктов
  class Client
    BASE_URL = 'https://fakestoreapi.com'

    def initialize
      @connection = Faraday.new(url: BASE_URL) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger, Application.logger
        faraday.adapter Faraday.default_adapter
      end
    end

    def fetch_carts
      log_request('/carts')
      @connection.get('/carts').body
    end

    def fetch_user(user_id)
      log_request("/users/#{user_id}")
      @connection.get("/users/#{user_id}").body
    end

    def fetch_product(product_id)
      log_request("/products/#{product_id}")
      @connection.get("/products/#{product_id}").body
    end

    private

    def log_request(endpoint)
      Application.logger.info "Запрос #{endpoint} из FakeStoreAPI"
    end
  end
end
