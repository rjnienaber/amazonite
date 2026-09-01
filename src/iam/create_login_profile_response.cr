private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [CreateLoginProfile](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateLoginProfile.html)
  # request.
  class CreateLoginProfileResponse
    # A structure containing the user name and password create date.
    property login_profile : LoginProfile

    def initialize(
      @login_profile : LoginProfile,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@login_profile.to_query_params("#{prefix}LoginProfile."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        login_profile: node.xpath_node("*[local-name()='LoginProfile']").try { |n| LoginProfile.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @login_profile
        value.validate!
      end
    end

    def_equals_and_hash(@login_profile)
  end
end
