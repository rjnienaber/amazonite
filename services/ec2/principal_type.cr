private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PrincipalType
    All
    Service
    OrganizationUnit
    Account
    User
    Role

    def self.to_json(e : PrincipalType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PrincipalType
      value = pull.read_string
      case value
      when "All"              then AEC::PrincipalType::All
      when "Service"          then AEC::PrincipalType::Service
      when "OrganizationUnit" then AEC::PrincipalType::OrganizationUnit
      when "Account"          then AEC::PrincipalType::Account
      when "User"             then AEC::PrincipalType::User
      when "Role"             then AEC::PrincipalType::Role
      else
        raise Exception.new("unknown enum value for 'PrincipalType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::PrincipalType?
      case key
      when "All"              then AEC::PrincipalType::All
      when "Service"          then AEC::PrincipalType::Service
      when "OrganizationUnit" then AEC::PrincipalType::OrganizationUnit
      when "Account"          then AEC::PrincipalType::Account
      when "User"             then AEC::PrincipalType::User
      when "Role"             then AEC::PrincipalType::Role
      else
        nil
      end
    end
  end
end
