class MockConfig < Amazonite::Core::Config
  protected def api_version
    "0.1.1"
  end

  protected def crystal_version
    "1.5.0"
  end

  protected def crystal_build_commit
    "41573fadc"
  end

  protected def crystal_llvm_version
    "13.0.2"
  end

  protected def crystal_description
    "Crystal 1.6.0 [41573fadb] (2022-10-06)\n\nLLVM: 13.0.1\nDefault target: arm_64-unknown-linux-gnu"
  end
end
