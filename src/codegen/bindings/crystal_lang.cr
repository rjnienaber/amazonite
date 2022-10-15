module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class CrystalLang < Base
    getter version

    def initialize(@version = Crystal::VERSION)
    end
  end
end
