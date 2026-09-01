private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [GetOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetOpenIDConnectProvider.html)
  # request.
  class GetOpenIDConnectProviderResponse
    # The URL that the IAM OIDC provider resource object is associated with. For more information, see
    # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html).
    property url : String | Nil

    # A list of client IDs (also known as audiences) that are associated with the specified IAM OIDC
    # provider resource object. For more information, see
    # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html).
    property client_id_list : Array(String) | Nil

    # A list of certificate thumbprints that are associated with the specified IAM OIDC provider
    # resource object. For more information, see
    # [CreateOpenIDConnectProvider](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateOpenIDConnectProvider.html).
    property thumbprint_list : Array(String) | Nil

    # The date and time when the IAM OIDC provider resource object was created in the Amazon Web
    # Services account.
    property create_date : Time | Nil

    # A list of tags that are attached to the specified IAM OIDC provider. The returned list of tags
    # is sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
    property tags : Array(Tag) | Nil

    def initialize(
      @url : String | Nil = nil,
      @client_id_list : Array(String) | Nil = nil,
      @thumbprint_list : Array(String) | Nil = nil,
      @create_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @url
        params << {"#{prefix}Url", value}
      end

      (@client_id_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ClientIDList.member.#{i}", item}
      end

      (@thumbprint_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ThumbprintList.member.#{i}", item}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        url: Core::XMLValue.string(node.xpath_node("*[local-name()='Url']")),
        client_id_list: node.xpath_nodes("*[local-name()='ClientIDList']/*[local-name()='member']").map { |n| n.content },
        thumbprint_list: node.xpath_nodes("*[local-name()='ThumbprintList']/*[local-name()='member']").map { |n| n.content },
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @url
        raise Core::ValidationError.new("Url length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Url length must be <= 255") if value.size > 255
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@url, @client_id_list, @thumbprint_list, @create_date, @tags)
  end
end
