module Amazonite::Codegen::Service
  class Enum < Shape
    def self.enum?(json : JSON::Any)
      !!json["enum"]?
    end

    @crystal_values : Array(String) | Nil
    @modulized_crystal_values : Array(String) | Nil
    @enums : Array(String)
    @aws_mappings : Array(Tuple(String, String)) | Nil
    @crystal_mappings : Array(Tuple(String, String)) | Nil

    getter enums

    def initialize(name : String, json : JSON::Any)
      super(name, json)
      @enums = json["enum"].as_a.map(&.to_s)
    end

    def aws_mappings? : Bool
      !aws_mappings.empty?
    end

    def values
      aws_mappings? ? crystal_values : @enums
    end

    def aws_mappings : Array(Tuple(String, String))
      return @aws_mappings.as(Array(Tuple(String, String))) if @aws_mappings

      input_output_identical = crystal_values.zip(@enums).all? { |v| v[0] == v[1] }
      return [] of Tuple(String, String) if input_output_identical

      @aws_mappings = modulized_crystal_values.zip(@enums)
    end

    def crystal_mappings : Array(Tuple(String, String))
      @crystal_mappings ||= @enums.zip(modulized_crystal_values)
    end

    private def crystal_values : Array(String)
      return @crystal_values.as(Array(String)) if @crystal_values

      # special case enums that look like version numbers and
      # prefix with a 'V' to be a valid enum
      @crystal_values = @enums.map do |e|
        /^[\d\.]+$/.match(e) ? "V#{Utils.pascal_case(e)}" : Utils.pascal_case(e)
      end
    end

    private def modulized_crystal_values
      @modulized_crystal_values ||= crystal_values.map { |v| modulize_enum_value(v) }
    end

    private def modulize_enum_value(enum_value)
      "#{name}::#{enum_value}"
    end
  end
end
