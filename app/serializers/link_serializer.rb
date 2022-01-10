class LinkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :long_url, :slug
end
