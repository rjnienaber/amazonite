private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum DocumentationPartType
    Api
    Authorizer
    Model
    Resource
    Method
    PathParameter
    QueryParameter
    RequestHeader
    RequestBody
    Response
    ResponseHeader
    ResponseBody

    def self.to_json(e : DocumentationPartType, json : JSON::Builder) : Nil
      value = case e
              when AAG::DocumentationPartType::Api            then "API"
              when AAG::DocumentationPartType::Authorizer     then "AUTHORIZER"
              when AAG::DocumentationPartType::Model          then "MODEL"
              when AAG::DocumentationPartType::Resource       then "RESOURCE"
              when AAG::DocumentationPartType::Method         then "METHOD"
              when AAG::DocumentationPartType::PathParameter  then "PATH_PARAMETER"
              when AAG::DocumentationPartType::QueryParameter then "QUERY_PARAMETER"
              when AAG::DocumentationPartType::RequestHeader  then "REQUEST_HEADER"
              when AAG::DocumentationPartType::RequestBody    then "REQUEST_BODY"
              when AAG::DocumentationPartType::Response       then "RESPONSE"
              when AAG::DocumentationPartType::ResponseHeader then "RESPONSE_HEADER"
              when AAG::DocumentationPartType::ResponseBody   then "RESPONSE_BODY"
              else
                raise Exception.new("unknown enum value for 'DocumentationPartType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::DocumentationPartType
      value = pull.read_string
      case value
      when "API"             then AAG::DocumentationPartType::Api
      when "AUTHORIZER"      then AAG::DocumentationPartType::Authorizer
      when "MODEL"           then AAG::DocumentationPartType::Model
      when "RESOURCE"        then AAG::DocumentationPartType::Resource
      when "METHOD"          then AAG::DocumentationPartType::Method
      when "PATH_PARAMETER"  then AAG::DocumentationPartType::PathParameter
      when "QUERY_PARAMETER" then AAG::DocumentationPartType::QueryParameter
      when "REQUEST_HEADER"  then AAG::DocumentationPartType::RequestHeader
      when "REQUEST_BODY"    then AAG::DocumentationPartType::RequestBody
      when "RESPONSE"        then AAG::DocumentationPartType::Response
      when "RESPONSE_HEADER" then AAG::DocumentationPartType::ResponseHeader
      when "RESPONSE_BODY"   then AAG::DocumentationPartType::ResponseBody
      else
        raise Exception.new("unknown enum value for 'DocumentationPartType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::DocumentationPartType::Api            then "API"
      when AAG::DocumentationPartType::Authorizer     then "AUTHORIZER"
      when AAG::DocumentationPartType::Model          then "MODEL"
      when AAG::DocumentationPartType::Resource       then "RESOURCE"
      when AAG::DocumentationPartType::Method         then "METHOD"
      when AAG::DocumentationPartType::PathParameter  then "PATH_PARAMETER"
      when AAG::DocumentationPartType::QueryParameter then "QUERY_PARAMETER"
      when AAG::DocumentationPartType::RequestHeader  then "REQUEST_HEADER"
      when AAG::DocumentationPartType::RequestBody    then "REQUEST_BODY"
      when AAG::DocumentationPartType::Response       then "RESPONSE"
      when AAG::DocumentationPartType::ResponseHeader then "RESPONSE_HEADER"
      when AAG::DocumentationPartType::ResponseBody   then "RESPONSE_BODY"
      else
        raise Exception.new("unknown enum value for 'DocumentationPartType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::DocumentationPartType?
      case key
      when "API"             then AAG::DocumentationPartType::Api
      when "AUTHORIZER"      then AAG::DocumentationPartType::Authorizer
      when "MODEL"           then AAG::DocumentationPartType::Model
      when "RESOURCE"        then AAG::DocumentationPartType::Resource
      when "METHOD"          then AAG::DocumentationPartType::Method
      when "PATH_PARAMETER"  then AAG::DocumentationPartType::PathParameter
      when "QUERY_PARAMETER" then AAG::DocumentationPartType::QueryParameter
      when "REQUEST_HEADER"  then AAG::DocumentationPartType::RequestHeader
      when "REQUEST_BODY"    then AAG::DocumentationPartType::RequestBody
      when "RESPONSE"        then AAG::DocumentationPartType::Response
      when "RESPONSE_HEADER" then AAG::DocumentationPartType::ResponseHeader
      when "RESPONSE_BODY"   then AAG::DocumentationPartType::ResponseBody
      else
        nil
      end
    end
  end
end
