private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum Op
    Add
    Remove
    Replace
    Move
    Copy
    Test

    def self.to_json(e : Op, json : JSON::Builder) : Nil
      value = case e
              when AAG::Op::Add     then "add"
              when AAG::Op::Remove  then "remove"
              when AAG::Op::Replace then "replace"
              when AAG::Op::Move    then "move"
              when AAG::Op::Copy    then "copy"
              when AAG::Op::Test    then "test"
              else
                raise Exception.new("unknown enum value for 'Op' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::Op
      value = pull.read_string
      case value
      when "add"     then AAG::Op::Add
      when "remove"  then AAG::Op::Remove
      when "replace" then AAG::Op::Replace
      when "move"    then AAG::Op::Move
      when "copy"    then AAG::Op::Copy
      when "test"    then AAG::Op::Test
      else
        raise Exception.new("unknown enum value for 'Op' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::Op::Add     then "add"
      when AAG::Op::Remove  then "remove"
      when AAG::Op::Replace then "replace"
      when AAG::Op::Move    then "move"
      when AAG::Op::Copy    then "copy"
      when AAG::Op::Test    then "test"
      else
        raise Exception.new("unknown enum value for 'Op' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::Op?
      case key
      when "add"     then AAG::Op::Add
      when "remove"  then AAG::Op::Remove
      when "replace" then AAG::Op::Replace
      when "move"    then AAG::Op::Move
      when "copy"    then AAG::Op::Copy
      when "test"    then AAG::Op::Test
      else
        nil
      end
    end
  end
end
