private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerAssociationState
    Associating
    Associated
    Disassociating

    def self.to_json(e : RouteServerAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerAssociationState::Associating    then "associating"
              when AEC::RouteServerAssociationState::Associated     then "associated"
              when AEC::RouteServerAssociationState::Disassociating then "disassociating"
              else
                raise Exception.new("unknown enum value for 'RouteServerAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerAssociationState
      value = pull.read_string
      case value
      when "associating"    then AEC::RouteServerAssociationState::Associating
      when "associated"     then AEC::RouteServerAssociationState::Associated
      when "disassociating" then AEC::RouteServerAssociationState::Disassociating
      else
        raise Exception.new("unknown enum value for 'RouteServerAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerAssociationState::Associating    then "associating"
      when AEC::RouteServerAssociationState::Associated     then "associated"
      when AEC::RouteServerAssociationState::Disassociating then "disassociating"
      else
        raise Exception.new("unknown enum value for 'RouteServerAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerAssociationState?
      case key
      when "associating"    then AEC::RouteServerAssociationState::Associating
      when "associated"     then AEC::RouteServerAssociationState::Associated
      when "disassociating" then AEC::RouteServerAssociationState::Disassociating
      else
        nil
      end
    end
  end
end
