private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum ImportState
    Imported
    PendingImport

    def self.to_json(e : ImportState, json : JSON::Builder) : Nil
      value = case e
              when AK::ImportState::Imported      then "IMPORTED"
              when AK::ImportState::PendingImport then "PENDING_IMPORT"
              else
                raise Exception.new("unknown enum value for 'ImportState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ImportState
      value = pull.read_string
      case value
      when "IMPORTED"       then AK::ImportState::Imported
      when "PENDING_IMPORT" then AK::ImportState::PendingImport
      else
        raise Exception.new("unknown enum value for 'ImportState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ImportState::Imported      then "IMPORTED"
      when AK::ImportState::PendingImport then "PENDING_IMPORT"
      else
        raise Exception.new("unknown enum value for 'ImportState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ImportState?
      case key
      when "IMPORTED"       then AK::ImportState::Imported
      when "PENDING_IMPORT" then AK::ImportState::PendingImport
      else
        nil
      end
    end
  end
end
