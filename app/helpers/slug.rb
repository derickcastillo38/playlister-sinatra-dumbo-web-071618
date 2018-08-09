module Slug

  module InstanceMethods
    def slug
      name.downcase.gsub(/[ ]/,"-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.find do |instance|
        instance.slug == slug
      end
    end
  end

end
# nested in helpers folder which alphabetically comes before models folder...which is necessary for "include" and "extend"
