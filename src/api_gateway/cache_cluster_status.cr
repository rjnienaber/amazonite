private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # Returns the status of the CacheCluster.
  enum CacheClusterStatus
    CreateInProgress
    Available
    DeleteInProgress
    NotAvailable
    FlushInProgress

    def self.to_json(e : CacheClusterStatus, json : JSON::Builder) : Nil
      value = case e
              when AAG::CacheClusterStatus::CreateInProgress then "CREATE_IN_PROGRESS"
              when AAG::CacheClusterStatus::Available        then "AVAILABLE"
              when AAG::CacheClusterStatus::DeleteInProgress then "DELETE_IN_PROGRESS"
              when AAG::CacheClusterStatus::NotAvailable     then "NOT_AVAILABLE"
              when AAG::CacheClusterStatus::FlushInProgress  then "FLUSH_IN_PROGRESS"
              else
                raise Exception.new("unknown enum value for 'CacheClusterStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::CacheClusterStatus
      value = pull.read_string
      case value
      when "CREATE_IN_PROGRESS" then AAG::CacheClusterStatus::CreateInProgress
      when "AVAILABLE"          then AAG::CacheClusterStatus::Available
      when "DELETE_IN_PROGRESS" then AAG::CacheClusterStatus::DeleteInProgress
      when "NOT_AVAILABLE"      then AAG::CacheClusterStatus::NotAvailable
      when "FLUSH_IN_PROGRESS"  then AAG::CacheClusterStatus::FlushInProgress
      else
        raise Exception.new("unknown enum value for 'CacheClusterStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::CacheClusterStatus::CreateInProgress then "CREATE_IN_PROGRESS"
      when AAG::CacheClusterStatus::Available        then "AVAILABLE"
      when AAG::CacheClusterStatus::DeleteInProgress then "DELETE_IN_PROGRESS"
      when AAG::CacheClusterStatus::NotAvailable     then "NOT_AVAILABLE"
      when AAG::CacheClusterStatus::FlushInProgress  then "FLUSH_IN_PROGRESS"
      else
        raise Exception.new("unknown enum value for 'CacheClusterStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::CacheClusterStatus?
      case key
      when "CREATE_IN_PROGRESS" then AAG::CacheClusterStatus::CreateInProgress
      when "AVAILABLE"          then AAG::CacheClusterStatus::Available
      when "DELETE_IN_PROGRESS" then AAG::CacheClusterStatus::DeleteInProgress
      when "NOT_AVAILABLE"      then AAG::CacheClusterStatus::NotAvailable
      when "FLUSH_IN_PROGRESS"  then AAG::CacheClusterStatus::FlushInProgress
      else
        nil
      end
    end
  end
end
