private alias AS = Amazonite::S3

module Amazonite::S3
  enum Permission
    FullControl
    Write
    WriteAcp
    Read
    ReadAcp

    def self.to_json(e : Permission, json : JSON::Builder) : Nil
      value = case e
              when AS::Permission::FullControl then "FULL_CONTROL"
              when AS::Permission::Write       then "WRITE"
              when AS::Permission::WriteAcp    then "WRITE_ACP"
              when AS::Permission::Read        then "READ"
              when AS::Permission::ReadAcp     then "READ_ACP"
              else
                raise Exception.new("unknown enum value for 'Permission' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::Permission
      value = pull.read_string
      case value
      when "FULL_CONTROL" then AS::Permission::FullControl
      when "WRITE"        then AS::Permission::Write
      when "WRITE_ACP"    then AS::Permission::WriteAcp
      when "READ"         then AS::Permission::Read
      when "READ_ACP"     then AS::Permission::ReadAcp
      else
        raise Exception.new("unknown enum value for 'Permission' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::Permission::FullControl then "FULL_CONTROL"
      when AS::Permission::Write       then "WRITE"
      when AS::Permission::WriteAcp    then "WRITE_ACP"
      when AS::Permission::Read        then "READ"
      when AS::Permission::ReadAcp     then "READ_ACP"
      else
        raise Exception.new("unknown enum value for 'Permission' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::Permission?
      case key
      when "FULL_CONTROL" then AS::Permission::FullControl
      when "WRITE"        then AS::Permission::Write
      when "WRITE_ACP"    then AS::Permission::WriteAcp
      when "READ"         then AS::Permission::Read
      when "READ_ACP"     then AS::Permission::ReadAcp
      else
        nil
      end
    end
  end
end
