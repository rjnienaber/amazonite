private alias Core = Amazonite::Core

module Amazonite::IamV1
  class VirtualMFADevice
    property serial_number : String
    property base_32_string_seed : String | Nil
    property qr_code_png : String | Nil
    property user : User | Nil
    property enable_date : Time | Nil
    property tags : Array(Tag) | Nil

    def initialize(
      @serial_number : String,
      @base_32_string_seed : String | Nil = nil,
      @qr_code_png : String | Nil = nil,
      @user : User | Nil = nil,
      @enable_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      values = {} of Symbol => String
      tags = [] of Tag
      node.children.each do |n|
        case n.name
        when "SerialNumber"     then values[:serial_number] = n.children[0].to_s
        when "Base32StringSeed" then @base_32_string_seed = n.children[0].to_s
        when "QRCodePNG"        then @qr_code_png = n.children[0].to_s
        when "User"             then @user = User.new(n)
        when "EnableDate"       then @enable_date = Core::StringUtils.to_time(n.children[0].to_s)
        when "Tag"              then tags << Tag.new(n)
        end
      end

      @serial_number = values[:serial_number]
      @tags = tags unless tags.empty?
    end
  end
end