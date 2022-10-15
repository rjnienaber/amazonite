module Amazonite::Codegen::Service
  # TODO: rename to Enumeration
  class Enum < Shape
    private SCREAMING_CASE_REGEX = /^[A-Z_\d]+$/
    private PASCAL_CASE_REGEX    = /^[A-Za-z]+$/ # TODO: better regex to detect PascalCase?

    def self.enum?(json : JSON::Any)
      !!json["enum"]?
    end

    @crystal_values : Array(String) | Nil
    @modulized_crystal_values : Array(String) | Nil
    @enums : Array(String)
    getter enums

    def initialize(name : String, json : JSON::Any, @service_name : String)
      super(name, json)
      @enums = json["enum"].as_a.map { |e| e.to_s }
    end

    def aws_mappings? : Bool
      !!aws_mappings
    end

    def values
      aws_mappings.nil? ? @enums : crystal_values
    end

    # TODO: cache
    def aws_mappings : Array(Tuple(String, String, String)) | Nil
      if @enums.all? { |e| SCREAMING_CASE_REGEX.matches?(e) }
        enum_values = modulized_crystal_values.zip(crystal_values, @enums)
        input_output_identical = true
        max_length = 0

        enum_values.each do |fqdn_new_name, new_name, e|
          max_length = Math.max(max_length, fqdn_new_name.size)
          input_output_identical &= new_name == e
        end

        enum_values.map { |v| {v[0], " " * (max_length - v[0].size), v[2]} } unless input_output_identical
      elsif @enums.all? { |e| PASCAL_CASE_REGEX.matches?(e) }
      else
        raise Exception.new("unknown enum casing for shape '#{@name}'")
      end
    end

    # TODO: cache
    def crystal_mappings : Array(Tuple(String, String, String))
      max_length = @enums.max_by { |e| e.size }.size
      enum_values = if @enums.all? { |e| SCREAMING_CASE_REGEX.matches?(e) }
                      @enums.zip(modulized_crystal_values)
                    elsif @enums.all? { |e| PASCAL_CASE_REGEX.matches?(e) }
                      # we modulize here because we are just accepting the values from AWS
                      @enums.map { |e| [e, modulize_enum_value(e)] }
                    else
                      raise Exception.new("unknown enum casing for shape '#{@name}'")
                    end
      enum_values.map { |v| {v[0], " " * (max_length - v[0].size), v[1]} }
    end

    private def crystal_values
      @crystal_values ||= @enums.map { |e| e.split("_").map { |w| w.downcase.gsub(/^[a-z]/) { |s| s.upcase } }.join }
    end

    private def modulized_crystal_values
      @modulized_crystal_values ||= crystal_values.map { |v| modulize_enum_value(v) }
    end

    private def modulize_enum_value(enum_value)
      "Amazonite::#{@service_name}::#{@name}::#{enum_value}"
    end
  end
end
