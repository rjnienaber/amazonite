private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum UnauthorizedCacheControlHeaderStrategy
    FailWith403
    SucceedWithResponseHeader
    SucceedWithoutResponseHeader

    def self.to_json(e : UnauthorizedCacheControlHeaderStrategy, json : JSON::Builder) : Nil
      value = case e
              when AAG::UnauthorizedCacheControlHeaderStrategy::FailWith403                  then "FAIL_WITH_403"
              when AAG::UnauthorizedCacheControlHeaderStrategy::SucceedWithResponseHeader    then "SUCCEED_WITH_RESPONSE_HEADER"
              when AAG::UnauthorizedCacheControlHeaderStrategy::SucceedWithoutResponseHeader then "SUCCEED_WITHOUT_RESPONSE_HEADER"
              else
                raise Exception.new("unknown enum value for 'UnauthorizedCacheControlHeaderStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::UnauthorizedCacheControlHeaderStrategy
      value = pull.read_string
      case value
      when "FAIL_WITH_403"                   then AAG::UnauthorizedCacheControlHeaderStrategy::FailWith403
      when "SUCCEED_WITH_RESPONSE_HEADER"    then AAG::UnauthorizedCacheControlHeaderStrategy::SucceedWithResponseHeader
      when "SUCCEED_WITHOUT_RESPONSE_HEADER" then AAG::UnauthorizedCacheControlHeaderStrategy::SucceedWithoutResponseHeader
      else
        raise Exception.new("unknown enum value for 'UnauthorizedCacheControlHeaderStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::UnauthorizedCacheControlHeaderStrategy::FailWith403                  then "FAIL_WITH_403"
      when AAG::UnauthorizedCacheControlHeaderStrategy::SucceedWithResponseHeader    then "SUCCEED_WITH_RESPONSE_HEADER"
      when AAG::UnauthorizedCacheControlHeaderStrategy::SucceedWithoutResponseHeader then "SUCCEED_WITHOUT_RESPONSE_HEADER"
      else
        raise Exception.new("unknown enum value for 'UnauthorizedCacheControlHeaderStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::UnauthorizedCacheControlHeaderStrategy?
      case key
      when "FAIL_WITH_403"                   then AAG::UnauthorizedCacheControlHeaderStrategy::FailWith403
      when "SUCCEED_WITH_RESPONSE_HEADER"    then AAG::UnauthorizedCacheControlHeaderStrategy::SucceedWithResponseHeader
      when "SUCCEED_WITHOUT_RESPONSE_HEADER" then AAG::UnauthorizedCacheControlHeaderStrategy::SucceedWithoutResponseHeader
      else
        nil
      end
    end
  end
end
