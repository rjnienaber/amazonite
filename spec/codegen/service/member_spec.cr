require "../../spec_helper"

private alias Member = Amazonite::Codegen::Service::Member
private alias ShapeResolver = Amazonite::Codegen::Service::ShapeResolver

def create_member(shape_name : String, shapes_json : String, member_json : String? = nil) : Member
  resolver = ShapeResolver.load_json(JSON.parse(shapes_json))
  json = member_json || %({"shape": "#{shape_name}"})
  Member.new(shape_name, true, JSON.parse(json), resolver)
end

describe Member do
  describe "#pattern" do
    it "decodes a \\uXXXX escape (written for a language that decodes it before its regex engine sees it) into the real character, so PCRE2 (which has no \\u escape of its own) accepts it" do
      # a shrunk version of STS's real RoleArn pattern, which broke PCRE2
      # compilation before this decoding step existed
      shapes_json = %({"RoleArn": {"type": "string", "pattern": "^[\\\\u0009\\\\u0020-\\\\u007E]+$"}})

      pattern = create_member("RoleArn", shapes_json).pattern
      pattern.should_not be_nil
      pattern = pattern.as(String)
      pattern.should_not contain("\\u")
      Regex.new(pattern).matches?("hello").should be_true
    end

    it "drops the pattern entirely when it contains a lone UTF-16 surrogate half with no valid Unicode scalar value to decode to" do
      shapes_json = %({"Bad": {"type": "string", "pattern": "^[\\\\uD800]+$"}})

      create_member("Bad", shapes_json).pattern.should be_nil
    end

    it "is nil when the shape has no pattern trait" do
      shapes_json = %({"Plain": {"type": "string"}})

      create_member("Plain", shapes_json).pattern.should be_nil
    end
  end

  describe "#prefix_headers?" do
    it "is true for a map bound to a family of headers sharing a prefix" do
      shapes_json = %({"Metadata": {"type": "map", "key": {"shape": "S"}, "value": {"shape": "S"}}, "S": {"type": "string"}})
      member_json = %({"shape": "Metadata", "location": "headers", "locationName": "x-amz-meta-"})

      member = create_member("Metadata", shapes_json, member_json)
      member.prefix_headers?.should be_true
      member.header?.should be_false
      member.wire_name.should eq "x-amz-meta-"
    end

    it "is false for a member bound to a single named header" do
      shapes_json = %({"Metadata": {"type": "string"}})
      member_json = %({"shape": "Metadata", "location": "header", "locationName": "x-amz-meta"})

      create_member("Metadata", shapes_json, member_json).prefix_headers?.should be_false
    end
  end

  describe "#timestamp_format" do
    it "is the format its shape declares, which overrides the one implied by where the member is bound" do
      shapes_json = %({"Expires": {"type": "timestamp", "timestampFormat": "date-time"}})

      create_member("Expires", shapes_json).timestamp_format.should eq "date-time"
    end

    it "is nil when the shape declares none, leaving the default to the caller" do
      shapes_json = %({"LastModified": {"type": "timestamp"}})

      create_member("LastModified", shapes_json).timestamp_format.should be_nil
    end
  end
end
