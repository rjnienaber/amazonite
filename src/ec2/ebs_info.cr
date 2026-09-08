private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the Amazon EBS features supported by the instance type.
  class EbsInfo
    # Indicates whether the instance type is Amazon EBS-optimized. For more information, see [Amazon
    # EBS-optimized instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html)
    # in *Amazon EC2 User Guide*.
    property ebs_optimized_support : EbsOptimizedSupport | Nil

    # Indicates whether Amazon EBS encryption is supported.
    property encryption_support : EbsEncryptionSupport | Nil

    # Describes the optimized EBS performance for the instance type.
    property ebs_optimized_info : EbsOptimizedInfo | Nil

    # Indicates whether non-volatile memory express (NVMe) is supported.
    property nvme_support : EbsNvmeSupport | Nil

    # Indicates the maximum number of Amazon EBS volumes that can be attached to the instance type.
    # For more information, see [Amazon EBS volume limits for Amazon EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/volume_limits.html) in the
    # *Amazon EC2 User Guide*.
    property maximum_ebs_attachments : Int32 | Nil

    # Indicates whether the instance type features a shared or dedicated Amazon EBS volume attachment
    # limit. For more information, see [Amazon EBS volume limits for Amazon EC2
    # instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/volume_limits.html) in the
    # *Amazon EC2 User Guide*.
    property attachment_limit_type : AttachmentLimitType | Nil

    # Indicates the number of EBS cards supported by the instance type.
    property maximum_ebs_cards : Int32 | Nil

    # Describes the EBS cards available for the instance type.
    property ebs_cards : Array(EbsCardInfo) | Nil

    def initialize(
      @ebs_optimized_support : EbsOptimizedSupport | Nil = nil,
      @encryption_support : EbsEncryptionSupport | Nil = nil,
      @ebs_optimized_info : EbsOptimizedInfo | Nil = nil,
      @nvme_support : EbsNvmeSupport | Nil = nil,
      @maximum_ebs_attachments : Int32 | Nil = nil,
      @attachment_limit_type : AttachmentLimitType | Nil = nil,
      @maximum_ebs_cards : Int32 | Nil = nil,
      @ebs_cards : Array(EbsCardInfo) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ebs_optimized_support
        params << {"#{prefix}EbsOptimizedSupport", value.to_json_object_key}
      end

      if value = @encryption_support
        params << {"#{prefix}EncryptionSupport", value.to_json_object_key}
      end

      if value = @ebs_optimized_info
        params.concat(value.to_query_params("#{prefix}EbsOptimizedInfo."))
      end

      if value = @nvme_support
        params << {"#{prefix}NvmeSupport", value.to_json_object_key}
      end

      if value = @maximum_ebs_attachments
        params << {"#{prefix}MaximumEbsAttachments", value.to_s}
      end

      if value = @attachment_limit_type
        params << {"#{prefix}AttachmentLimitType", value.to_json_object_key}
      end

      if value = @maximum_ebs_cards
        params << {"#{prefix}MaximumEbsCards", value.to_s}
      end

      (@ebs_cards || [] of EbsCardInfo).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}EbsCardSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ebs_optimized_support: (n = node.xpath_node("*[local-name()='ebsOptimizedSupport']")) ? AEC::EbsOptimizedSupport.from_json_object_key?(n.content) : nil,
        encryption_support: (n = node.xpath_node("*[local-name()='encryptionSupport']")) ? AEC::EbsEncryptionSupport.from_json_object_key?(n.content) : nil,
        ebs_optimized_info: node.xpath_node("*[local-name()='ebsOptimizedInfo']").try { |n| EbsOptimizedInfo.from_xml(n) },
        nvme_support: (n = node.xpath_node("*[local-name()='nvmeSupport']")) ? AEC::EbsNvmeSupport.from_json_object_key?(n.content) : nil,
        maximum_ebs_attachments: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumEbsAttachments']")),
        attachment_limit_type: (n = node.xpath_node("*[local-name()='attachmentLimitType']")) ? AEC::AttachmentLimitType.from_json_object_key?(n.content) : nil,
        maximum_ebs_cards: Core::XMLValue.i32(node.xpath_node("*[local-name()='maximumEbsCards']")),
        ebs_cards: node.xpath_nodes("*[local-name()='ebsCardSet']/*[local-name()='item']").map { |n| EbsCardInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ebs_optimized_info
        value.validate!
      end

      if value = @ebs_cards
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ebs_optimized_support, @encryption_support, @ebs_optimized_info, @nvme_support, @maximum_ebs_attachments, @attachment_limit_type, @maximum_ebs_cards, @ebs_cards)
  end
end
