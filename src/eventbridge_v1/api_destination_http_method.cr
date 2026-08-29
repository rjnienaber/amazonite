private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum ApiDestinationHttpMethod
    Post
    Get
    Head
    Options
    Put
    Patch
    Delete

    def self.to_json(e : ApiDestinationHttpMethod, json : JSON::Builder) : Nil
      value = case e
              when AEB::ApiDestinationHttpMethod::Post    then "POST"
              when AEB::ApiDestinationHttpMethod::Get     then "GET"
              when AEB::ApiDestinationHttpMethod::Head    then "HEAD"
              when AEB::ApiDestinationHttpMethod::Options then "OPTIONS"
              when AEB::ApiDestinationHttpMethod::Put     then "PUT"
              when AEB::ApiDestinationHttpMethod::Patch   then "PATCH"
              when AEB::ApiDestinationHttpMethod::Delete  then "DELETE"
              else
                raise Exception.new("unknown enum value for 'ApiDestinationHttpMethod' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::ApiDestinationHttpMethod
      value = pull.read_string
      case value
      when "POST"    then AEB::ApiDestinationHttpMethod::Post
      when "GET"     then AEB::ApiDestinationHttpMethod::Get
      when "HEAD"    then AEB::ApiDestinationHttpMethod::Head
      when "OPTIONS" then AEB::ApiDestinationHttpMethod::Options
      when "PUT"     then AEB::ApiDestinationHttpMethod::Put
      when "PATCH"   then AEB::ApiDestinationHttpMethod::Patch
      when "DELETE"  then AEB::ApiDestinationHttpMethod::Delete
      else
        raise Exception.new("unknown enum value for 'ApiDestinationHttpMethod' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::ApiDestinationHttpMethod::Post    then "POST"
      when AEB::ApiDestinationHttpMethod::Get     then "GET"
      when AEB::ApiDestinationHttpMethod::Head    then "HEAD"
      when AEB::ApiDestinationHttpMethod::Options then "OPTIONS"
      when AEB::ApiDestinationHttpMethod::Put     then "PUT"
      when AEB::ApiDestinationHttpMethod::Patch   then "PATCH"
      when AEB::ApiDestinationHttpMethod::Delete  then "DELETE"
      else
        raise Exception.new("unknown enum value for 'ApiDestinationHttpMethod' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::ApiDestinationHttpMethod?
      case key
      when "POST"    then AEB::ApiDestinationHttpMethod::Post
      when "GET"     then AEB::ApiDestinationHttpMethod::Get
      when "HEAD"    then AEB::ApiDestinationHttpMethod::Head
      when "OPTIONS" then AEB::ApiDestinationHttpMethod::Options
      when "PUT"     then AEB::ApiDestinationHttpMethod::Put
      when "PATCH"   then AEB::ApiDestinationHttpMethod::Patch
      when "DELETE"  then AEB::ApiDestinationHttpMethod::Delete
      else
        nil
      end
    end
  end
end
