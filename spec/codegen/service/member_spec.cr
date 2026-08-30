require "../../spec_helper"

private alias Member = Amazonite::Codegen::Service::Member
private alias ShapeResolver = Amazonite::Codegen::Service::ShapeResolver

def create_member(shape_name : String, shapes_json : String) : Member
  resolver = ShapeResolver.load_json(JSON.parse(shapes_json))
  Member.new(shape_name, true, JSON.parse(%({"shape": "#{shape_name}"})), resolver)
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
end
