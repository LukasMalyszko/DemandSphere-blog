require "net/http"
require "uri"
require "json"
require "rest-client"
require 'nokogiri'
require "./.api_key.rb"

class AuthController < ApplicationController
  def index
    if session[:user_id]
      redirect_to action: "home"
    end

  end

  def signup
    email = params[:email]
    password = params[:password]

    uri = URI("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=
              #{$api_key}")

    res = Net::HTTP.post_form(
      uri,
      "email" => email,
      "password" => password
      )

    data = JSON.parse(res.body)

    if res.is_a?(Net::HTTPSuccess)
      redirect_to action: "index"
    end
  end

  def login
    email = params[:email]
    password = params[:password]

    uri = URI("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=
              #{$api_key}")

    res = Net::HTTP.post_form(
      uri,
      "email" => email,
      "password" => password
      )

    data = JSON.parse(res.body)

    if res.is_a?(Net::HTTPSuccess)
      session[:user_id] = data["localId"]

      redirect_to action: "home"
    end
  end

  def logout
    session.clear
    redirect_to action: "index"
  end

  def fetch_articles(num)
  url = "https://www.demandsphere.com/feed/"
  response = RestClient.get(url)
  xml = Nokogiri::XML(response.body)

  articles = []

  xml.xpath('//item').each do |item|
    title = item.at('title').text
    link = item.at('link').text
    creator = item.at('dc|creator',
    'dc' => 'http://purl.org/dc/elements/1.1/').text
    pub_date = Date.parse(item.at('pubDate').text).strftime("%Y-%m-%d")
    description = item.at('description').inner_html

    articles << {
      title: title,
      link: link,
      creator: creator,
      pub_date: pub_date,
      description: description
    }
  end

  articles.first(num)
end


  def home

    if session[:user_id]
       @articles = fetch_articles(5)

    else
      redirect_to action: "index"
    end
  end

end
