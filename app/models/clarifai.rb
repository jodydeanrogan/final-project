require 'net/http'
require 'uri'
require 'json'
require 'figaro/env'

class Clarifai < ApplicationRecord

  def self.get_token
    @token = Clarifai.first_or_create()
    uri = URI.parse("https://api.clarifai.com/v1/token/")
    request = Net::HTTP::Post.new(uri)
    request.set_form_data(
      "client_id" => ENV['CLARIFAI_CLIENT_ID'],
      "client_secret" => ENV['CLARIFAI_CLIENT_SECRET'],
      "grant_type" => "client_credentials",
    )
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response_code = JSON.parse(response.code)
    body = JSON.parse(response.body)
    token = body["access_token"]
    expires = body["expires_in"]
    @token.update(access_token: token, expires_in: expires)
    @response = { code: response_code, access_token: token, expires_in: expires }
  end

  def self.get_tags(token, image_url)
    uri = URI.parse("https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/outputs")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "Bearer #{token}"
    request.body = JSON.dump({
      "inputs" => [
        {
          "data" => {
            "image" => {
              "url" => image_url
            }
          }
        }
      ]
    })
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response_code = JSON.parse(response.code)
    body = JSON.parse(response.body)
    concepts = body["outputs"][0]["data"]["concepts"]
    @tags = concepts.map do |concept|
      concept["name"]
    end
    @response = { code: response_code, tags: @tags }
  end

end
