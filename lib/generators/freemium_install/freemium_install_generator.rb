class FreemiumInstallGenerator < Rails::Generators::Base
  desc "Creates a Freemium initializer and copy locale files to your application."

  def self.source_root
    @_devise_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def copy_initializer
    template "freemium.rb", "config/initializers/freemium.rb"
  end

  def copy_locale
    copy_file "../../../../config/locales/en.yml", "config/locales/freemium.en.yml"    
  end

  def show_readme
    readme "README"
  end

  protected
  
  def readme(path)
    say File.read(File.expand_path(path, self.class.source_root))
  end
end