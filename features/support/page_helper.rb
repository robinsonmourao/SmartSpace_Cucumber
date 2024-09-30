require 'capybara'
require 'capybara/dsl'
require 'sqlite3'

Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module Pages
  def home_page_helper
    @home ||= HomePage.new
  end
end
