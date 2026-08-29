private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum SortKeyType
    ServiceNamespaceAscending
    ServiceNamespaceDescending
    LastAuthenticatedTimeAscending
    LastAuthenticatedTimeDescending

    def self.to_json(e : SortKeyType, json : JSON::Builder) : Nil
      value = case e
              when AI::SortKeyType::ServiceNamespaceAscending       then "SERVICE_NAMESPACE_ASCENDING"
              when AI::SortKeyType::ServiceNamespaceDescending      then "SERVICE_NAMESPACE_DESCENDING"
              when AI::SortKeyType::LastAuthenticatedTimeAscending  then "LAST_AUTHENTICATED_TIME_ASCENDING"
              when AI::SortKeyType::LastAuthenticatedTimeDescending then "LAST_AUTHENTICATED_TIME_DESCENDING"
              else
                raise Exception.new("unknown enum value for 'SortKeyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AI::SortKeyType
      value = pull.read_string
      case value
      when "SERVICE_NAMESPACE_ASCENDING"        then AI::SortKeyType::ServiceNamespaceAscending
      when "SERVICE_NAMESPACE_DESCENDING"       then AI::SortKeyType::ServiceNamespaceDescending
      when "LAST_AUTHENTICATED_TIME_ASCENDING"  then AI::SortKeyType::LastAuthenticatedTimeAscending
      when "LAST_AUTHENTICATED_TIME_DESCENDING" then AI::SortKeyType::LastAuthenticatedTimeDescending
      else
        raise Exception.new("unknown enum value for 'SortKeyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AI::SortKeyType::ServiceNamespaceAscending       then "SERVICE_NAMESPACE_ASCENDING"
      when AI::SortKeyType::ServiceNamespaceDescending      then "SERVICE_NAMESPACE_DESCENDING"
      when AI::SortKeyType::LastAuthenticatedTimeAscending  then "LAST_AUTHENTICATED_TIME_ASCENDING"
      when AI::SortKeyType::LastAuthenticatedTimeDescending then "LAST_AUTHENTICATED_TIME_DESCENDING"
      else
        raise Exception.new("unknown enum value for 'SortKeyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AI::SortKeyType?
      case key
      when "SERVICE_NAMESPACE_ASCENDING"        then AI::SortKeyType::ServiceNamespaceAscending
      when "SERVICE_NAMESPACE_DESCENDING"       then AI::SortKeyType::ServiceNamespaceDescending
      when "LAST_AUTHENTICATED_TIME_ASCENDING"  then AI::SortKeyType::LastAuthenticatedTimeAscending
      when "LAST_AUTHENTICATED_TIME_DESCENDING" then AI::SortKeyType::LastAuthenticatedTimeDescending
      else
        nil
      end
    end
  end
end
