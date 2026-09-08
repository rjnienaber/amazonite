private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceType
    A1Medium
    A1Large
    A1Xlarge
    A12xlarge
    A14xlarge
    A1Metal
    C1Medium
    C1Xlarge
    C3Large
    C3Xlarge
    C32xlarge
    C34xlarge
    C38xlarge
    C4Large
    C4Xlarge
    C42xlarge
    C44xlarge
    C48xlarge
    C5Large
    C5Xlarge
    C52xlarge
    C54xlarge
    C59xlarge
    C512xlarge
    C518xlarge
    C524xlarge
    C5Metal
    C5aLarge
    C5aXlarge
    C5a2xlarge
    C5a4xlarge
    C5a8xlarge
    C5a12xlarge
    C5a16xlarge
    C5a24xlarge
    C5adLarge
    C5adXlarge
    C5ad2xlarge
    C5ad4xlarge
    C5ad8xlarge
    C5ad12xlarge
    C5ad16xlarge
    C5ad24xlarge
    C5dLarge
    C5dXlarge
    C5d2xlarge
    C5d4xlarge
    C5d9xlarge
    C5d12xlarge
    C5d18xlarge
    C5d24xlarge
    C5dMetal
    C5nLarge
    C5nXlarge
    C5n2xlarge
    C5n4xlarge
    C5n9xlarge
    C5n18xlarge
    C5nMetal
    C6gMedium
    C6gLarge
    C6gXlarge
    C6g2xlarge
    C6g4xlarge
    C6g8xlarge
    C6g12xlarge
    C6g16xlarge
    C6gMetal
    C6gdMedium
    C6gdLarge
    C6gdXlarge
    C6gd2xlarge
    C6gd4xlarge
    C6gd8xlarge
    C6gd12xlarge
    C6gd16xlarge
    C6gdMetal
    C6gnMedium
    C6gnLarge
    C6gnXlarge
    C6gn2xlarge
    C6gn4xlarge
    C6gn8xlarge
    C6gn12xlarge
    C6gn16xlarge
    C6iLarge
    C6iXlarge
    C6i2xlarge
    C6i4xlarge
    C6i8xlarge
    C6i12xlarge
    C6i16xlarge
    C6i24xlarge
    C6i32xlarge
    C6iMetal
    Cc14xlarge
    Cc28xlarge
    Cg14xlarge
    Cr18xlarge
    D2Xlarge
    D22xlarge
    D24xlarge
    D28xlarge
    D3Xlarge
    D32xlarge
    D34xlarge
    D38xlarge
    D3enXlarge
    D3en2xlarge
    D3en4xlarge
    D3en6xlarge
    D3en8xlarge
    D3en12xlarge
    Dl124xlarge
    F12xlarge
    F14xlarge
    F116xlarge
    G22xlarge
    G28xlarge
    G34xlarge
    G38xlarge
    G316xlarge
    G3sXlarge
    G4adXlarge
    G4ad2xlarge
    G4ad4xlarge
    G4ad8xlarge
    G4ad16xlarge
    G4dnXlarge
    G4dn2xlarge
    G4dn4xlarge
    G4dn8xlarge
    G4dn12xlarge
    G4dn16xlarge
    G4dnMetal
    G5Xlarge
    G52xlarge
    G54xlarge
    G58xlarge
    G512xlarge
    G516xlarge
    G524xlarge
    G548xlarge
    G5gXlarge
    G5g2xlarge
    G5g4xlarge
    G5g8xlarge
    G5g16xlarge
    G5gMetal
    Hi14xlarge
    Hpc6a48xlarge
    Hs18xlarge
    H12xlarge
    H14xlarge
    H18xlarge
    H116xlarge
    I2Xlarge
    I22xlarge
    I24xlarge
    I28xlarge
    I3Large
    I3Xlarge
    I32xlarge
    I34xlarge
    I38xlarge
    I316xlarge
    I3Metal
    I3enLarge
    I3enXlarge
    I3en2xlarge
    I3en3xlarge
    I3en6xlarge
    I3en12xlarge
    I3en24xlarge
    I3enMetal
    Im4gnLarge
    Im4gnXlarge
    Im4gn2xlarge
    Im4gn4xlarge
    Im4gn8xlarge
    Im4gn16xlarge
    Inf1Xlarge
    Inf12xlarge
    Inf16xlarge
    Inf124xlarge
    Is4genMedium
    Is4genLarge
    Is4genXlarge
    Is4gen2xlarge
    Is4gen4xlarge
    Is4gen8xlarge
    M1Small
    M1Medium
    M1Large
    M1Xlarge
    M2Xlarge
    M22xlarge
    M24xlarge
    M3Medium
    M3Large
    M3Xlarge
    M32xlarge
    M4Large
    M4Xlarge
    M42xlarge
    M44xlarge
    M410xlarge
    M416xlarge
    M5Large
    M5Xlarge
    M52xlarge
    M54xlarge
    M58xlarge
    M512xlarge
    M516xlarge
    M524xlarge
    M5Metal
    M5aLarge
    M5aXlarge
    M5a2xlarge
    M5a4xlarge
    M5a8xlarge
    M5a12xlarge
    M5a16xlarge
    M5a24xlarge
    M5adLarge
    M5adXlarge
    M5ad2xlarge
    M5ad4xlarge
    M5ad8xlarge
    M5ad12xlarge
    M5ad16xlarge
    M5ad24xlarge
    M5dLarge
    M5dXlarge
    M5d2xlarge
    M5d4xlarge
    M5d8xlarge
    M5d12xlarge
    M5d16xlarge
    M5d24xlarge
    M5dMetal
    M5dnLarge
    M5dnXlarge
    M5dn2xlarge
    M5dn4xlarge
    M5dn8xlarge
    M5dn12xlarge
    M5dn16xlarge
    M5dn24xlarge
    M5dnMetal
    M5nLarge
    M5nXlarge
    M5n2xlarge
    M5n4xlarge
    M5n8xlarge
    M5n12xlarge
    M5n16xlarge
    M5n24xlarge
    M5nMetal
    M5znLarge
    M5znXlarge
    M5zn2xlarge
    M5zn3xlarge
    M5zn6xlarge
    M5zn12xlarge
    M5znMetal
    M6aLarge
    M6aXlarge
    M6a2xlarge
    M6a4xlarge
    M6a8xlarge
    M6a12xlarge
    M6a16xlarge
    M6a24xlarge
    M6a32xlarge
    M6a48xlarge
    M6gMetal
    M6gMedium
    M6gLarge
    M6gXlarge
    M6g2xlarge
    M6g4xlarge
    M6g8xlarge
    M6g12xlarge
    M6g16xlarge
    M6gdMetal
    M6gdMedium
    M6gdLarge
    M6gdXlarge
    M6gd2xlarge
    M6gd4xlarge
    M6gd8xlarge
    M6gd12xlarge
    M6gd16xlarge
    M6iLarge
    M6iXlarge
    M6i2xlarge
    M6i4xlarge
    M6i8xlarge
    M6i12xlarge
    M6i16xlarge
    M6i24xlarge
    M6i32xlarge
    M6iMetal
    Mac1Metal
    P2Xlarge
    P28xlarge
    P216xlarge
    P32xlarge
    P38xlarge
    P316xlarge
    P3dn24xlarge
    P4d24xlarge
    R3Large
    R3Xlarge
    R32xlarge
    R34xlarge
    R38xlarge
    R4Large
    R4Xlarge
    R42xlarge
    R44xlarge
    R48xlarge
    R416xlarge
    R5Large
    R5Xlarge
    R52xlarge
    R54xlarge
    R58xlarge
    R512xlarge
    R516xlarge
    R524xlarge
    R5Metal
    R5aLarge
    R5aXlarge
    R5a2xlarge
    R5a4xlarge
    R5a8xlarge
    R5a12xlarge
    R5a16xlarge
    R5a24xlarge
    R5adLarge
    R5adXlarge
    R5ad2xlarge
    R5ad4xlarge
    R5ad8xlarge
    R5ad12xlarge
    R5ad16xlarge
    R5ad24xlarge
    R5bLarge
    R5bXlarge
    R5b2xlarge
    R5b4xlarge
    R5b8xlarge
    R5b12xlarge
    R5b16xlarge
    R5b24xlarge
    R5bMetal
    R5dLarge
    R5dXlarge
    R5d2xlarge
    R5d4xlarge
    R5d8xlarge
    R5d12xlarge
    R5d16xlarge
    R5d24xlarge
    R5dMetal
    R5dnLarge
    R5dnXlarge
    R5dn2xlarge
    R5dn4xlarge
    R5dn8xlarge
    R5dn12xlarge
    R5dn16xlarge
    R5dn24xlarge
    R5dnMetal
    R5nLarge
    R5nXlarge
    R5n2xlarge
    R5n4xlarge
    R5n8xlarge
    R5n12xlarge
    R5n16xlarge
    R5n24xlarge
    R5nMetal
    R6gMedium
    R6gLarge
    R6gXlarge
    R6g2xlarge
    R6g4xlarge
    R6g8xlarge
    R6g12xlarge
    R6g16xlarge
    R6gMetal
    R6gdMedium
    R6gdLarge
    R6gdXlarge
    R6gd2xlarge
    R6gd4xlarge
    R6gd8xlarge
    R6gd12xlarge
    R6gd16xlarge
    R6gdMetal
    R6iLarge
    R6iXlarge
    R6i2xlarge
    R6i4xlarge
    R6i8xlarge
    R6i12xlarge
    R6i16xlarge
    R6i24xlarge
    R6i32xlarge
    R6iMetal
    T1Micro
    T2Nano
    T2Micro
    T2Small
    T2Medium
    T2Large
    T2Xlarge
    T22xlarge
    T3Nano
    T3Micro
    T3Small
    T3Medium
    T3Large
    T3Xlarge
    T32xlarge
    T3aNano
    T3aMicro
    T3aSmall
    T3aMedium
    T3aLarge
    T3aXlarge
    T3a2xlarge
    T4gNano
    T4gMicro
    T4gSmall
    T4gMedium
    T4gLarge
    T4gXlarge
    T4g2xlarge
    U6tb156xlarge
    U6tb1112xlarge
    U9tb1112xlarge
    U12tb1112xlarge
    U6tb1Metal
    U9tb1Metal
    U12tb1Metal
    U18tb1Metal
    U24tb1Metal
    Vt13xlarge
    Vt16xlarge
    Vt124xlarge
    X116xlarge
    X132xlarge
    X1eXlarge
    X1e2xlarge
    X1e4xlarge
    X1e8xlarge
    X1e16xlarge
    X1e32xlarge
    X2iezn2xlarge
    X2iezn4xlarge
    X2iezn6xlarge
    X2iezn8xlarge
    X2iezn12xlarge
    X2ieznMetal
    X2gdMedium
    X2gdLarge
    X2gdXlarge
    X2gd2xlarge
    X2gd4xlarge
    X2gd8xlarge
    X2gd12xlarge
    X2gd16xlarge
    X2gdMetal
    Z1dLarge
    Z1dXlarge
    Z1d2xlarge
    Z1d3xlarge
    Z1d6xlarge
    Z1d12xlarge
    Z1dMetal
    X2idn16xlarge
    X2idn24xlarge
    X2idn32xlarge
    X2iednXlarge
    X2iedn2xlarge
    X2iedn4xlarge
    X2iedn8xlarge
    X2iedn16xlarge
    X2iedn24xlarge
    X2iedn32xlarge
    C6aLarge
    C6aXlarge
    C6a2xlarge
    C6a4xlarge
    C6a8xlarge
    C6a12xlarge
    C6a16xlarge
    C6a24xlarge
    C6a32xlarge
    C6a48xlarge
    C6aMetal
    M6aMetal
    I4iLarge
    I4iXlarge
    I4i2xlarge
    I4i4xlarge
    I4i8xlarge
    I4i16xlarge
    I4i32xlarge
    I4iMetal
    X2idnMetal
    X2iednMetal
    C7gMedium
    C7gLarge
    C7gXlarge
    C7g2xlarge
    C7g4xlarge
    C7g8xlarge
    C7g12xlarge
    C7g16xlarge
    Mac2Metal
    C6idLarge
    C6idXlarge
    C6id2xlarge
    C6id4xlarge
    C6id8xlarge
    C6id12xlarge
    C6id16xlarge
    C6id24xlarge
    C6id32xlarge
    C6idMetal
    M6idLarge
    M6idXlarge
    M6id2xlarge
    M6id4xlarge
    M6id8xlarge
    M6id12xlarge
    M6id16xlarge
    M6id24xlarge
    M6id32xlarge
    M6idMetal
    R6idLarge
    R6idXlarge
    R6id2xlarge
    R6id4xlarge
    R6id8xlarge
    R6id12xlarge
    R6id16xlarge
    R6id24xlarge
    R6id32xlarge
    R6idMetal
    R6aLarge
    R6aXlarge
    R6a2xlarge
    R6a4xlarge
    R6a8xlarge
    R6a12xlarge
    R6a16xlarge
    R6a24xlarge
    R6a32xlarge
    R6a48xlarge
    R6aMetal
    P4de24xlarge
    U3tb156xlarge
    U18tb1112xlarge
    U24tb1112xlarge
    Trn12xlarge
    Trn132xlarge
    Hpc6id32xlarge
    C6inLarge
    C6inXlarge
    C6in2xlarge
    C6in4xlarge
    C6in8xlarge
    C6in12xlarge
    C6in16xlarge
    C6in24xlarge
    C6in32xlarge
    M6inLarge
    M6inXlarge
    M6in2xlarge
    M6in4xlarge
    M6in8xlarge
    M6in12xlarge
    M6in16xlarge
    M6in24xlarge
    M6in32xlarge
    M6idnLarge
    M6idnXlarge
    M6idn2xlarge
    M6idn4xlarge
    M6idn8xlarge
    M6idn12xlarge
    M6idn16xlarge
    M6idn24xlarge
    M6idn32xlarge
    R6inLarge
    R6inXlarge
    R6in2xlarge
    R6in4xlarge
    R6in8xlarge
    R6in12xlarge
    R6in16xlarge
    R6in24xlarge
    R6in32xlarge
    R6idnLarge
    R6idnXlarge
    R6idn2xlarge
    R6idn4xlarge
    R6idn8xlarge
    R6idn12xlarge
    R6idn16xlarge
    R6idn24xlarge
    R6idn32xlarge
    C7gMetal
    M7gMedium
    M7gLarge
    M7gXlarge
    M7g2xlarge
    M7g4xlarge
    M7g8xlarge
    M7g12xlarge
    M7g16xlarge
    M7gMetal
    R7gMedium
    R7gLarge
    R7gXlarge
    R7g2xlarge
    R7g4xlarge
    R7g8xlarge
    R7g12xlarge
    R7g16xlarge
    R7gMetal
    C6inMetal
    M6inMetal
    M6idnMetal
    R6inMetal
    R6idnMetal
    Inf2Xlarge
    Inf28xlarge
    Inf224xlarge
    Inf248xlarge
    Trn1n32xlarge
    I4gLarge
    I4gXlarge
    I4g2xlarge
    I4g4xlarge
    I4g8xlarge
    I4g16xlarge
    Hpc7g4xlarge
    Hpc7g8xlarge
    Hpc7g16xlarge
    C7gnMedium
    C7gnLarge
    C7gnXlarge
    C7gn2xlarge
    C7gn4xlarge
    C7gn8xlarge
    C7gn12xlarge
    C7gn16xlarge
    P548xlarge
    M7iLarge
    M7iXlarge
    M7i2xlarge
    M7i4xlarge
    M7i8xlarge
    M7i12xlarge
    M7i16xlarge
    M7i24xlarge
    M7i48xlarge
    M7iFlexLarge
    M7iFlexXlarge
    M7iFlex2xlarge
    M7iFlex4xlarge
    M7iFlex8xlarge
    M7aMedium
    M7aLarge
    M7aXlarge
    M7a2xlarge
    M7a4xlarge
    M7a8xlarge
    M7a12xlarge
    M7a16xlarge
    M7a24xlarge
    M7a32xlarge
    M7a48xlarge
    M7aMetal48xl
    Hpc7a12xlarge
    Hpc7a24xlarge
    Hpc7a48xlarge
    Hpc7a96xlarge
    C7gdMedium
    C7gdLarge
    C7gdXlarge
    C7gd2xlarge
    C7gd4xlarge
    C7gd8xlarge
    C7gd12xlarge
    C7gd16xlarge
    M7gdMedium
    M7gdLarge
    M7gdXlarge
    M7gd2xlarge
    M7gd4xlarge
    M7gd8xlarge
    M7gd12xlarge
    M7gd16xlarge
    R7gdMedium
    R7gdLarge
    R7gdXlarge
    R7gd2xlarge
    R7gd4xlarge
    R7gd8xlarge
    R7gd12xlarge
    R7gd16xlarge
    R7aMedium
    R7aLarge
    R7aXlarge
    R7a2xlarge
    R7a4xlarge
    R7a8xlarge
    R7a12xlarge
    R7a16xlarge
    R7a24xlarge
    R7a32xlarge
    R7a48xlarge
    C7iLarge
    C7iXlarge
    C7i2xlarge
    C7i4xlarge
    C7i8xlarge
    C7i12xlarge
    C7i16xlarge
    C7i24xlarge
    C7i48xlarge
    Mac2M2proMetal
    R7izLarge
    R7izXlarge
    R7iz2xlarge
    R7iz4xlarge
    R7iz8xlarge
    R7iz12xlarge
    R7iz16xlarge
    R7iz32xlarge
    C7aMedium
    C7aLarge
    C7aXlarge
    C7a2xlarge
    C7a4xlarge
    C7a8xlarge
    C7a12xlarge
    C7a16xlarge
    C7a24xlarge
    C7a32xlarge
    C7a48xlarge
    C7aMetal48xl
    R7aMetal48xl
    R7iLarge
    R7iXlarge
    R7i2xlarge
    R7i4xlarge
    R7i8xlarge
    R7i12xlarge
    R7i16xlarge
    R7i24xlarge
    R7i48xlarge
    Dl2q24xlarge
    Mac2M2Metal
    I4i12xlarge
    I4i24xlarge
    C7iMetal24xl
    C7iMetal48xl
    M7iMetal24xl
    M7iMetal48xl
    R7iMetal24xl
    R7iMetal48xl
    R7izMetal16xl
    R7izMetal32xl
    C7gdMetal
    M7gdMetal
    R7gdMetal
    G6Xlarge
    G62xlarge
    G64xlarge
    G68xlarge
    G612xlarge
    G616xlarge
    G624xlarge
    G648xlarge
    Gr64xlarge
    Gr68xlarge
    C7iFlexLarge
    C7iFlexXlarge
    C7iFlex2xlarge
    C7iFlex4xlarge
    C7iFlex8xlarge
    U7i12tb224xlarge
    U7in16tb224xlarge
    U7in24tb224xlarge
    U7in32tb224xlarge
    U7ib12tb224xlarge
    C7gnMetal
    R8gMedium
    R8gLarge
    R8gXlarge
    R8g2xlarge
    R8g4xlarge
    R8g8xlarge
    R8g12xlarge
    R8g16xlarge
    R8g24xlarge
    R8g48xlarge
    R8gMetal24xl
    R8gMetal48xl
    Mac2M1ultraMetal
    G6eXlarge
    G6e2xlarge
    G6e4xlarge
    G6e8xlarge
    G6e12xlarge
    G6e16xlarge
    G6e24xlarge
    G6e48xlarge
    C8gMedium
    C8gLarge
    C8gXlarge
    C8g2xlarge
    C8g4xlarge
    C8g8xlarge
    C8g12xlarge
    C8g16xlarge
    C8g24xlarge
    C8g48xlarge
    C8gMetal24xl
    C8gMetal48xl
    M8gMedium
    M8gLarge
    M8gXlarge
    M8g2xlarge
    M8g4xlarge
    M8g8xlarge
    M8g12xlarge
    M8g16xlarge
    M8g24xlarge
    M8g48xlarge
    M8gMetal24xl
    M8gMetal48xl
    X8gMedium
    X8gLarge
    X8gXlarge
    X8g2xlarge
    X8g4xlarge
    X8g8xlarge
    X8g12xlarge
    X8g16xlarge
    X8g24xlarge
    X8g48xlarge
    X8gMetal24xl
    X8gMetal48xl
    I7ieLarge
    I7ieXlarge
    I7ie2xlarge
    I7ie3xlarge
    I7ie6xlarge
    I7ie12xlarge
    I7ie18xlarge
    I7ie24xlarge
    I7ie48xlarge
    I8gLarge
    I8gXlarge
    I8g2xlarge
    I8g4xlarge
    I8g8xlarge
    I8g12xlarge
    I8g16xlarge
    I8g24xlarge
    I8gMetal24xl
    U7i6tb112xlarge
    U7i8tb112xlarge
    U7inh32tb480xlarge
    P5e48xlarge
    P5en48xlarge
    F212xlarge
    F248xlarge
    Trn248xlarge
    C7iFlex12xlarge
    C7iFlex16xlarge
    M7iFlex12xlarge
    M7iFlex16xlarge
    I7ieMetal24xl
    I7ieMetal48xl
    I8g48xlarge
    C8gdMedium
    C8gdLarge
    C8gdXlarge
    C8gd2xlarge
    C8gd4xlarge
    C8gd8xlarge
    C8gd12xlarge
    C8gd16xlarge
    C8gd24xlarge
    C8gd48xlarge
    C8gdMetal24xl
    C8gdMetal48xl
    I7iLarge
    I7iXlarge
    I7i2xlarge
    I7i4xlarge
    I7i8xlarge
    I7i12xlarge
    I7i16xlarge
    I7i24xlarge
    I7i48xlarge
    I7iMetal24xl
    I7iMetal48xl
    P6B20048xlarge
    M8gdMedium
    M8gdLarge
    M8gdXlarge
    M8gd2xlarge
    M8gd4xlarge
    M8gd8xlarge
    M8gd12xlarge
    M8gd16xlarge
    M8gd24xlarge
    M8gd48xlarge
    M8gdMetal24xl
    M8gdMetal48xl
    R8gdMedium
    R8gdLarge
    R8gdXlarge
    R8gd2xlarge
    R8gd4xlarge
    R8gd8xlarge
    R8gd12xlarge
    R8gd16xlarge
    R8gd24xlarge
    R8gd48xlarge
    R8gdMetal24xl
    R8gdMetal48xl
    C8gnMedium
    C8gnLarge
    C8gnXlarge
    C8gn2xlarge
    C8gn4xlarge
    C8gn8xlarge
    C8gn12xlarge
    C8gn16xlarge
    C8gn24xlarge
    C8gn48xlarge
    C8gnMetal24xl
    C8gnMetal48xl
    F26xlarge
    P6eGb20036xlarge
    G6fLarge
    G6fXlarge
    G6f2xlarge
    G6f4xlarge
    Gr6f4xlarge
    P54xlarge
    R8iLarge
    R8iXlarge
    R8i2xlarge
    R8i4xlarge
    R8i8xlarge
    R8i12xlarge
    R8i16xlarge
    R8i24xlarge
    R8i32xlarge
    R8i48xlarge
    R8i96xlarge
    R8iMetal48xl
    R8iMetal96xl
    R8iFlexLarge
    R8iFlexXlarge
    R8iFlex2xlarge
    R8iFlex4xlarge
    R8iFlex8xlarge
    R8iFlex12xlarge
    R8iFlex16xlarge
    M8iLarge
    M8iXlarge
    M8i2xlarge
    M8i4xlarge
    M8i8xlarge
    M8i12xlarge
    M8i16xlarge
    M8i24xlarge
    M8i32xlarge
    M8i48xlarge
    M8i96xlarge
    M8iMetal48xl
    M8iMetal96xl
    M8iFlexLarge
    M8iFlexXlarge
    M8iFlex2xlarge
    M8iFlex4xlarge
    M8iFlex8xlarge
    M8iFlex12xlarge
    M8iFlex16xlarge
    I8geLarge
    I8geXlarge
    I8ge2xlarge
    I8ge3xlarge
    I8ge6xlarge
    I8ge12xlarge
    I8ge18xlarge
    I8ge24xlarge
    I8ge48xlarge
    I8geMetal24xl
    I8geMetal48xl
    MacM4Metal
    MacM4proMetal
    R8gnMedium
    R8gnLarge
    R8gnXlarge
    R8gn2xlarge
    R8gn4xlarge
    R8gn8xlarge
    R8gn12xlarge
    R8gn16xlarge
    R8gn24xlarge
    R8gn48xlarge
    R8gnMetal24xl
    R8gnMetal48xl
    C8iLarge
    C8iXlarge
    C8i2xlarge
    C8i4xlarge
    C8i8xlarge
    C8i12xlarge
    C8i16xlarge
    C8i24xlarge
    C8i32xlarge
    C8i48xlarge
    C8i96xlarge
    C8iMetal48xl
    C8iMetal96xl
    C8iFlexLarge
    C8iFlexXlarge
    C8iFlex2xlarge
    C8iFlex4xlarge
    C8iFlex8xlarge
    C8iFlex12xlarge
    C8iFlex16xlarge
    R8gbMedium
    R8gbLarge
    R8gbXlarge
    R8gb2xlarge
    R8gb4xlarge
    R8gb8xlarge
    R8gb12xlarge
    R8gb16xlarge
    R8gb24xlarge
    R8gbMetal24xl
    M8aMedium
    M8aLarge
    M8aXlarge
    M8a2xlarge
    M8a4xlarge
    M8a8xlarge
    M8a12xlarge
    M8a16xlarge
    M8a24xlarge
    M8a48xlarge
    M8aMetal24xl
    M8aMetal48xl
    Trn23xlarge
    R8aMedium
    R8aLarge
    R8aXlarge
    R8a2xlarge
    R8a4xlarge
    R8a8xlarge
    R8a12xlarge
    R8a16xlarge
    R8a24xlarge
    R8a48xlarge
    R8aMetal24xl
    R8aMetal48xl
    P6B30048xlarge
    C8aMedium
    C8aLarge
    C8aXlarge
    C8a2xlarge
    C8a4xlarge
    C8a8xlarge
    C8a12xlarge
    C8a16xlarge
    C8a24xlarge
    C8a48xlarge
    C8aMetal24xl
    C8aMetal48xl
    C8gb12xlarge
    C8gb16xlarge
    C8gb24xlarge
    C8gb2xlarge
    C8gb4xlarge
    C8gb8xlarge
    C8gbLarge
    C8gbMedium
    C8gbMetal24xl
    C8gbXlarge
    C8gb48xlarge
    C8gbMetal48xl
    M8gb12xlarge
    M8gb16xlarge
    M8gb24xlarge
    M8gb2xlarge
    M8gb4xlarge
    M8gb8xlarge
    M8gbLarge
    M8gbMedium
    M8gbXlarge
    M8gb48xlarge
    M8gbMetal24xl
    M8gbMetal48xl
    M8gn12xlarge
    M8gn16xlarge
    M8gn24xlarge
    M8gn2xlarge
    M8gn48xlarge
    M8gn4xlarge
    M8gn8xlarge
    M8gnLarge
    M8gnMedium
    M8gnXlarge
    M8gnMetal24xl
    M8gnMetal48xl
    X8aedz12xlarge
    X8aedz24xlarge
    X8aedz3xlarge
    X8aedz6xlarge
    X8aedzLarge
    X8aedzMetal12xl
    X8aedzMetal24xl
    X8aedzXlarge
    M8aznMedium
    M8aznLarge
    M8aznXlarge
    M8azn3xlarge
    M8azn6xlarge
    M8azn12xlarge
    M8azn24xlarge
    M8aznMetal12xl
    M8aznMetal24xl
    X8iLarge
    X8iXlarge
    X8i2xlarge
    X8i4xlarge
    X8i8xlarge
    X8i12xlarge
    X8i16xlarge
    X8i24xlarge
    X8i32xlarge
    X8i48xlarge
    X8i64xlarge
    X8i96xlarge
    X8iMetal48xl
    X8iMetal96xl
    MacM4maxMetal
    G7e2xlarge
    G7e4xlarge
    G7e8xlarge
    G7e12xlarge
    G7e24xlarge
    G7e48xlarge
    R8idLarge
    R8idXlarge
    R8id2xlarge
    R8id4xlarge
    R8id8xlarge
    R8id12xlarge
    R8id16xlarge
    R8id24xlarge
    R8id32xlarge
    R8id48xlarge
    R8id96xlarge
    R8idMetal48xl
    R8idMetal96xl
    C8idLarge
    C8idXlarge
    C8id2xlarge
    C8id4xlarge
    C8id8xlarge
    C8id12xlarge
    C8id16xlarge
    C8id24xlarge
    C8id32xlarge
    C8id48xlarge
    C8id96xlarge
    C8idMetal48xl
    C8idMetal96xl
    M8idLarge
    M8idXlarge
    M8id2xlarge
    M8id4xlarge
    M8id8xlarge
    M8id12xlarge
    M8id16xlarge
    M8id24xlarge
    M8id32xlarge
    M8id48xlarge
    M8id96xlarge
    M8idMetal48xl
    M8idMetal96xl
    Hpc8a96xlarge
    C8inLarge
    C8inXlarge
    C8in2xlarge
    C8in4xlarge
    C8in8xlarge
    C8in12xlarge
    C8in16xlarge
    C8in24xlarge
    C8in32xlarge
    C8in48xlarge
    C8in96xlarge
    C8inMetal48xl
    C8inMetal96xl
    C8ibLarge
    C8ibXlarge
    C8ib2xlarge
    C8ib4xlarge
    C8ib8xlarge
    C8ib12xlarge
    C8ib16xlarge
    C8ib24xlarge
    C8ib32xlarge
    C8ib48xlarge
    C8ib96xlarge
    C8ibMetal48xl
    C8ibMetal96xl
    R8inLarge
    R8inXlarge
    R8in2xlarge
    R8in4xlarge
    R8in8xlarge
    R8in12xlarge
    R8in16xlarge
    R8in24xlarge
    R8in32xlarge
    R8in48xlarge
    R8in96xlarge
    R8ibLarge
    R8ibXlarge
    R8ib2xlarge
    R8ib4xlarge
    R8ib8xlarge
    R8ib12xlarge
    R8ib16xlarge
    R8ib24xlarge
    R8ib32xlarge
    R8ib48xlarge
    R8ib96xlarge
    M8inLarge
    M8inXlarge
    M8in2xlarge
    M8in4xlarge
    M8in8xlarge
    M8in12xlarge
    M8in16xlarge
    M8in24xlarge
    M8in32xlarge
    M8in48xlarge
    M8in96xlarge
    M8ibLarge
    M8ibXlarge
    M8ib2xlarge
    M8ib4xlarge
    M8ib8xlarge
    M8ib12xlarge
    M8ib16xlarge
    M8ib24xlarge
    M8ib32xlarge
    M8ib48xlarge
    M8ib96xlarge
    M8ineLarge
    M8ineXlarge
    M8ine2xlarge
    M8ine4xlarge
    M8ine8xlarge
    M8ine12xlarge
    C8ineLarge
    C8ineXlarge
    C8ine2xlarge
    C8ine4xlarge
    C8ine8xlarge
    C8ine12xlarge
    M8idnLarge
    M8idnXlarge
    M8idn2xlarge
    M8idn4xlarge
    M8idn8xlarge
    M8idn12xlarge
    M8idn16xlarge
    M8idn24xlarge
    M8idn32xlarge
    M8idn48xlarge
    M8idn96xlarge
    R8idnLarge
    R8idnXlarge
    R8idn2xlarge
    R8idn4xlarge
    R8idn8xlarge
    R8idn12xlarge
    R8idn16xlarge
    R8idn24xlarge
    R8idn32xlarge
    R8idn48xlarge
    R8idn96xlarge
    M8idbLarge
    M8idbXlarge
    M8idb2xlarge
    M8idb4xlarge
    M8idb8xlarge
    M8idb12xlarge
    M8idb16xlarge
    M8idb24xlarge
    M8idb32xlarge
    M8idb48xlarge
    M8idb96xlarge
    R8idbLarge
    R8idbXlarge
    R8idb2xlarge
    R8idb4xlarge
    R8idb8xlarge
    R8idb12xlarge
    R8idb16xlarge
    R8idb24xlarge
    R8idb32xlarge
    R8idb48xlarge
    R8idb96xlarge
    MacM3ultraMetal
    M9gLarge
    M9gXlarge
    M9g2xlarge
    M9g4xlarge
    M9g8xlarge
    M9g12xlarge
    M9g16xlarge
    M9g24xlarge
    M9g48xlarge
    M9gMetal24xl
    M9gMetal48xl
    M9gdLarge
    M9gdXlarge
    M9gd2xlarge
    M9gd4xlarge
    M9gd8xlarge
    M9gd12xlarge
    M9gd16xlarge
    M9gd24xlarge
    M9gd48xlarge
    M9gdMetal24xl
    M9gdMetal48xl
    R8inMetal48xl
    R8inMetal96xl
    R8ibMetal48xl
    R8ibMetal96xl
    R8idnMetal48xl
    R8idnMetal96xl
    R8idbMetal48xl
    R8idbMetal96xl
    M8inMetal48xl
    M8inMetal96xl
    M8ibMetal48xl
    M8ibMetal96xl
    M8idnMetal48xl
    M8idnMetal96xl
    M8idbMetal48xl
    M8idbMetal96xl
    G72xlarge
    G74xlarge
    G78xlarge
    G712xlarge
    G724xlarge
    G748xlarge
    C9gMedium
    C9gLarge
    C9gXlarge
    C9g2xlarge
    C9g4xlarge
    C9g8xlarge
    C9g12xlarge
    C9g16xlarge
    C9g24xlarge
    C9g48xlarge
    C9gMetal48xl
    C9gdMedium
    C9gdLarge
    C9gdXlarge
    C9gd2xlarge
    C9gd4xlarge
    C9gd8xlarge
    C9gd12xlarge
    C9gd16xlarge
    C9gd24xlarge
    C9gd48xlarge
    C9gdMetal48xl

    def self.to_json(e : InstanceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceType::A1Medium           then "a1.medium"
              when AEC::InstanceType::A1Large            then "a1.large"
              when AEC::InstanceType::A1Xlarge           then "a1.xlarge"
              when AEC::InstanceType::A12xlarge          then "a1.2xlarge"
              when AEC::InstanceType::A14xlarge          then "a1.4xlarge"
              when AEC::InstanceType::A1Metal            then "a1.metal"
              when AEC::InstanceType::C1Medium           then "c1.medium"
              when AEC::InstanceType::C1Xlarge           then "c1.xlarge"
              when AEC::InstanceType::C3Large            then "c3.large"
              when AEC::InstanceType::C3Xlarge           then "c3.xlarge"
              when AEC::InstanceType::C32xlarge          then "c3.2xlarge"
              when AEC::InstanceType::C34xlarge          then "c3.4xlarge"
              when AEC::InstanceType::C38xlarge          then "c3.8xlarge"
              when AEC::InstanceType::C4Large            then "c4.large"
              when AEC::InstanceType::C4Xlarge           then "c4.xlarge"
              when AEC::InstanceType::C42xlarge          then "c4.2xlarge"
              when AEC::InstanceType::C44xlarge          then "c4.4xlarge"
              when AEC::InstanceType::C48xlarge          then "c4.8xlarge"
              when AEC::InstanceType::C5Large            then "c5.large"
              when AEC::InstanceType::C5Xlarge           then "c5.xlarge"
              when AEC::InstanceType::C52xlarge          then "c5.2xlarge"
              when AEC::InstanceType::C54xlarge          then "c5.4xlarge"
              when AEC::InstanceType::C59xlarge          then "c5.9xlarge"
              when AEC::InstanceType::C512xlarge         then "c5.12xlarge"
              when AEC::InstanceType::C518xlarge         then "c5.18xlarge"
              when AEC::InstanceType::C524xlarge         then "c5.24xlarge"
              when AEC::InstanceType::C5Metal            then "c5.metal"
              when AEC::InstanceType::C5aLarge           then "c5a.large"
              when AEC::InstanceType::C5aXlarge          then "c5a.xlarge"
              when AEC::InstanceType::C5a2xlarge         then "c5a.2xlarge"
              when AEC::InstanceType::C5a4xlarge         then "c5a.4xlarge"
              when AEC::InstanceType::C5a8xlarge         then "c5a.8xlarge"
              when AEC::InstanceType::C5a12xlarge        then "c5a.12xlarge"
              when AEC::InstanceType::C5a16xlarge        then "c5a.16xlarge"
              when AEC::InstanceType::C5a24xlarge        then "c5a.24xlarge"
              when AEC::InstanceType::C5adLarge          then "c5ad.large"
              when AEC::InstanceType::C5adXlarge         then "c5ad.xlarge"
              when AEC::InstanceType::C5ad2xlarge        then "c5ad.2xlarge"
              when AEC::InstanceType::C5ad4xlarge        then "c5ad.4xlarge"
              when AEC::InstanceType::C5ad8xlarge        then "c5ad.8xlarge"
              when AEC::InstanceType::C5ad12xlarge       then "c5ad.12xlarge"
              when AEC::InstanceType::C5ad16xlarge       then "c5ad.16xlarge"
              when AEC::InstanceType::C5ad24xlarge       then "c5ad.24xlarge"
              when AEC::InstanceType::C5dLarge           then "c5d.large"
              when AEC::InstanceType::C5dXlarge          then "c5d.xlarge"
              when AEC::InstanceType::C5d2xlarge         then "c5d.2xlarge"
              when AEC::InstanceType::C5d4xlarge         then "c5d.4xlarge"
              when AEC::InstanceType::C5d9xlarge         then "c5d.9xlarge"
              when AEC::InstanceType::C5d12xlarge        then "c5d.12xlarge"
              when AEC::InstanceType::C5d18xlarge        then "c5d.18xlarge"
              when AEC::InstanceType::C5d24xlarge        then "c5d.24xlarge"
              when AEC::InstanceType::C5dMetal           then "c5d.metal"
              when AEC::InstanceType::C5nLarge           then "c5n.large"
              when AEC::InstanceType::C5nXlarge          then "c5n.xlarge"
              when AEC::InstanceType::C5n2xlarge         then "c5n.2xlarge"
              when AEC::InstanceType::C5n4xlarge         then "c5n.4xlarge"
              when AEC::InstanceType::C5n9xlarge         then "c5n.9xlarge"
              when AEC::InstanceType::C5n18xlarge        then "c5n.18xlarge"
              when AEC::InstanceType::C5nMetal           then "c5n.metal"
              when AEC::InstanceType::C6gMedium          then "c6g.medium"
              when AEC::InstanceType::C6gLarge           then "c6g.large"
              when AEC::InstanceType::C6gXlarge          then "c6g.xlarge"
              when AEC::InstanceType::C6g2xlarge         then "c6g.2xlarge"
              when AEC::InstanceType::C6g4xlarge         then "c6g.4xlarge"
              when AEC::InstanceType::C6g8xlarge         then "c6g.8xlarge"
              when AEC::InstanceType::C6g12xlarge        then "c6g.12xlarge"
              when AEC::InstanceType::C6g16xlarge        then "c6g.16xlarge"
              when AEC::InstanceType::C6gMetal           then "c6g.metal"
              when AEC::InstanceType::C6gdMedium         then "c6gd.medium"
              when AEC::InstanceType::C6gdLarge          then "c6gd.large"
              when AEC::InstanceType::C6gdXlarge         then "c6gd.xlarge"
              when AEC::InstanceType::C6gd2xlarge        then "c6gd.2xlarge"
              when AEC::InstanceType::C6gd4xlarge        then "c6gd.4xlarge"
              when AEC::InstanceType::C6gd8xlarge        then "c6gd.8xlarge"
              when AEC::InstanceType::C6gd12xlarge       then "c6gd.12xlarge"
              when AEC::InstanceType::C6gd16xlarge       then "c6gd.16xlarge"
              when AEC::InstanceType::C6gdMetal          then "c6gd.metal"
              when AEC::InstanceType::C6gnMedium         then "c6gn.medium"
              when AEC::InstanceType::C6gnLarge          then "c6gn.large"
              when AEC::InstanceType::C6gnXlarge         then "c6gn.xlarge"
              when AEC::InstanceType::C6gn2xlarge        then "c6gn.2xlarge"
              when AEC::InstanceType::C6gn4xlarge        then "c6gn.4xlarge"
              when AEC::InstanceType::C6gn8xlarge        then "c6gn.8xlarge"
              when AEC::InstanceType::C6gn12xlarge       then "c6gn.12xlarge"
              when AEC::InstanceType::C6gn16xlarge       then "c6gn.16xlarge"
              when AEC::InstanceType::C6iLarge           then "c6i.large"
              when AEC::InstanceType::C6iXlarge          then "c6i.xlarge"
              when AEC::InstanceType::C6i2xlarge         then "c6i.2xlarge"
              when AEC::InstanceType::C6i4xlarge         then "c6i.4xlarge"
              when AEC::InstanceType::C6i8xlarge         then "c6i.8xlarge"
              when AEC::InstanceType::C6i12xlarge        then "c6i.12xlarge"
              when AEC::InstanceType::C6i16xlarge        then "c6i.16xlarge"
              when AEC::InstanceType::C6i24xlarge        then "c6i.24xlarge"
              when AEC::InstanceType::C6i32xlarge        then "c6i.32xlarge"
              when AEC::InstanceType::C6iMetal           then "c6i.metal"
              when AEC::InstanceType::Cc14xlarge         then "cc1.4xlarge"
              when AEC::InstanceType::Cc28xlarge         then "cc2.8xlarge"
              when AEC::InstanceType::Cg14xlarge         then "cg1.4xlarge"
              when AEC::InstanceType::Cr18xlarge         then "cr1.8xlarge"
              when AEC::InstanceType::D2Xlarge           then "d2.xlarge"
              when AEC::InstanceType::D22xlarge          then "d2.2xlarge"
              when AEC::InstanceType::D24xlarge          then "d2.4xlarge"
              when AEC::InstanceType::D28xlarge          then "d2.8xlarge"
              when AEC::InstanceType::D3Xlarge           then "d3.xlarge"
              when AEC::InstanceType::D32xlarge          then "d3.2xlarge"
              when AEC::InstanceType::D34xlarge          then "d3.4xlarge"
              when AEC::InstanceType::D38xlarge          then "d3.8xlarge"
              when AEC::InstanceType::D3enXlarge         then "d3en.xlarge"
              when AEC::InstanceType::D3en2xlarge        then "d3en.2xlarge"
              when AEC::InstanceType::D3en4xlarge        then "d3en.4xlarge"
              when AEC::InstanceType::D3en6xlarge        then "d3en.6xlarge"
              when AEC::InstanceType::D3en8xlarge        then "d3en.8xlarge"
              when AEC::InstanceType::D3en12xlarge       then "d3en.12xlarge"
              when AEC::InstanceType::Dl124xlarge        then "dl1.24xlarge"
              when AEC::InstanceType::F12xlarge          then "f1.2xlarge"
              when AEC::InstanceType::F14xlarge          then "f1.4xlarge"
              when AEC::InstanceType::F116xlarge         then "f1.16xlarge"
              when AEC::InstanceType::G22xlarge          then "g2.2xlarge"
              when AEC::InstanceType::G28xlarge          then "g2.8xlarge"
              when AEC::InstanceType::G34xlarge          then "g3.4xlarge"
              when AEC::InstanceType::G38xlarge          then "g3.8xlarge"
              when AEC::InstanceType::G316xlarge         then "g3.16xlarge"
              when AEC::InstanceType::G3sXlarge          then "g3s.xlarge"
              when AEC::InstanceType::G4adXlarge         then "g4ad.xlarge"
              when AEC::InstanceType::G4ad2xlarge        then "g4ad.2xlarge"
              when AEC::InstanceType::G4ad4xlarge        then "g4ad.4xlarge"
              when AEC::InstanceType::G4ad8xlarge        then "g4ad.8xlarge"
              when AEC::InstanceType::G4ad16xlarge       then "g4ad.16xlarge"
              when AEC::InstanceType::G4dnXlarge         then "g4dn.xlarge"
              when AEC::InstanceType::G4dn2xlarge        then "g4dn.2xlarge"
              when AEC::InstanceType::G4dn4xlarge        then "g4dn.4xlarge"
              when AEC::InstanceType::G4dn8xlarge        then "g4dn.8xlarge"
              when AEC::InstanceType::G4dn12xlarge       then "g4dn.12xlarge"
              when AEC::InstanceType::G4dn16xlarge       then "g4dn.16xlarge"
              when AEC::InstanceType::G4dnMetal          then "g4dn.metal"
              when AEC::InstanceType::G5Xlarge           then "g5.xlarge"
              when AEC::InstanceType::G52xlarge          then "g5.2xlarge"
              when AEC::InstanceType::G54xlarge          then "g5.4xlarge"
              when AEC::InstanceType::G58xlarge          then "g5.8xlarge"
              when AEC::InstanceType::G512xlarge         then "g5.12xlarge"
              when AEC::InstanceType::G516xlarge         then "g5.16xlarge"
              when AEC::InstanceType::G524xlarge         then "g5.24xlarge"
              when AEC::InstanceType::G548xlarge         then "g5.48xlarge"
              when AEC::InstanceType::G5gXlarge          then "g5g.xlarge"
              when AEC::InstanceType::G5g2xlarge         then "g5g.2xlarge"
              when AEC::InstanceType::G5g4xlarge         then "g5g.4xlarge"
              when AEC::InstanceType::G5g8xlarge         then "g5g.8xlarge"
              when AEC::InstanceType::G5g16xlarge        then "g5g.16xlarge"
              when AEC::InstanceType::G5gMetal           then "g5g.metal"
              when AEC::InstanceType::Hi14xlarge         then "hi1.4xlarge"
              when AEC::InstanceType::Hpc6a48xlarge      then "hpc6a.48xlarge"
              when AEC::InstanceType::Hs18xlarge         then "hs1.8xlarge"
              when AEC::InstanceType::H12xlarge          then "h1.2xlarge"
              when AEC::InstanceType::H14xlarge          then "h1.4xlarge"
              when AEC::InstanceType::H18xlarge          then "h1.8xlarge"
              when AEC::InstanceType::H116xlarge         then "h1.16xlarge"
              when AEC::InstanceType::I2Xlarge           then "i2.xlarge"
              when AEC::InstanceType::I22xlarge          then "i2.2xlarge"
              when AEC::InstanceType::I24xlarge          then "i2.4xlarge"
              when AEC::InstanceType::I28xlarge          then "i2.8xlarge"
              when AEC::InstanceType::I3Large            then "i3.large"
              when AEC::InstanceType::I3Xlarge           then "i3.xlarge"
              when AEC::InstanceType::I32xlarge          then "i3.2xlarge"
              when AEC::InstanceType::I34xlarge          then "i3.4xlarge"
              when AEC::InstanceType::I38xlarge          then "i3.8xlarge"
              when AEC::InstanceType::I316xlarge         then "i3.16xlarge"
              when AEC::InstanceType::I3Metal            then "i3.metal"
              when AEC::InstanceType::I3enLarge          then "i3en.large"
              when AEC::InstanceType::I3enXlarge         then "i3en.xlarge"
              when AEC::InstanceType::I3en2xlarge        then "i3en.2xlarge"
              when AEC::InstanceType::I3en3xlarge        then "i3en.3xlarge"
              when AEC::InstanceType::I3en6xlarge        then "i3en.6xlarge"
              when AEC::InstanceType::I3en12xlarge       then "i3en.12xlarge"
              when AEC::InstanceType::I3en24xlarge       then "i3en.24xlarge"
              when AEC::InstanceType::I3enMetal          then "i3en.metal"
              when AEC::InstanceType::Im4gnLarge         then "im4gn.large"
              when AEC::InstanceType::Im4gnXlarge        then "im4gn.xlarge"
              when AEC::InstanceType::Im4gn2xlarge       then "im4gn.2xlarge"
              when AEC::InstanceType::Im4gn4xlarge       then "im4gn.4xlarge"
              when AEC::InstanceType::Im4gn8xlarge       then "im4gn.8xlarge"
              when AEC::InstanceType::Im4gn16xlarge      then "im4gn.16xlarge"
              when AEC::InstanceType::Inf1Xlarge         then "inf1.xlarge"
              when AEC::InstanceType::Inf12xlarge        then "inf1.2xlarge"
              when AEC::InstanceType::Inf16xlarge        then "inf1.6xlarge"
              when AEC::InstanceType::Inf124xlarge       then "inf1.24xlarge"
              when AEC::InstanceType::Is4genMedium       then "is4gen.medium"
              when AEC::InstanceType::Is4genLarge        then "is4gen.large"
              when AEC::InstanceType::Is4genXlarge       then "is4gen.xlarge"
              when AEC::InstanceType::Is4gen2xlarge      then "is4gen.2xlarge"
              when AEC::InstanceType::Is4gen4xlarge      then "is4gen.4xlarge"
              when AEC::InstanceType::Is4gen8xlarge      then "is4gen.8xlarge"
              when AEC::InstanceType::M1Small            then "m1.small"
              when AEC::InstanceType::M1Medium           then "m1.medium"
              when AEC::InstanceType::M1Large            then "m1.large"
              when AEC::InstanceType::M1Xlarge           then "m1.xlarge"
              when AEC::InstanceType::M2Xlarge           then "m2.xlarge"
              when AEC::InstanceType::M22xlarge          then "m2.2xlarge"
              when AEC::InstanceType::M24xlarge          then "m2.4xlarge"
              when AEC::InstanceType::M3Medium           then "m3.medium"
              when AEC::InstanceType::M3Large            then "m3.large"
              when AEC::InstanceType::M3Xlarge           then "m3.xlarge"
              when AEC::InstanceType::M32xlarge          then "m3.2xlarge"
              when AEC::InstanceType::M4Large            then "m4.large"
              when AEC::InstanceType::M4Xlarge           then "m4.xlarge"
              when AEC::InstanceType::M42xlarge          then "m4.2xlarge"
              when AEC::InstanceType::M44xlarge          then "m4.4xlarge"
              when AEC::InstanceType::M410xlarge         then "m4.10xlarge"
              when AEC::InstanceType::M416xlarge         then "m4.16xlarge"
              when AEC::InstanceType::M5Large            then "m5.large"
              when AEC::InstanceType::M5Xlarge           then "m5.xlarge"
              when AEC::InstanceType::M52xlarge          then "m5.2xlarge"
              when AEC::InstanceType::M54xlarge          then "m5.4xlarge"
              when AEC::InstanceType::M58xlarge          then "m5.8xlarge"
              when AEC::InstanceType::M512xlarge         then "m5.12xlarge"
              when AEC::InstanceType::M516xlarge         then "m5.16xlarge"
              when AEC::InstanceType::M524xlarge         then "m5.24xlarge"
              when AEC::InstanceType::M5Metal            then "m5.metal"
              when AEC::InstanceType::M5aLarge           then "m5a.large"
              when AEC::InstanceType::M5aXlarge          then "m5a.xlarge"
              when AEC::InstanceType::M5a2xlarge         then "m5a.2xlarge"
              when AEC::InstanceType::M5a4xlarge         then "m5a.4xlarge"
              when AEC::InstanceType::M5a8xlarge         then "m5a.8xlarge"
              when AEC::InstanceType::M5a12xlarge        then "m5a.12xlarge"
              when AEC::InstanceType::M5a16xlarge        then "m5a.16xlarge"
              when AEC::InstanceType::M5a24xlarge        then "m5a.24xlarge"
              when AEC::InstanceType::M5adLarge          then "m5ad.large"
              when AEC::InstanceType::M5adXlarge         then "m5ad.xlarge"
              when AEC::InstanceType::M5ad2xlarge        then "m5ad.2xlarge"
              when AEC::InstanceType::M5ad4xlarge        then "m5ad.4xlarge"
              when AEC::InstanceType::M5ad8xlarge        then "m5ad.8xlarge"
              when AEC::InstanceType::M5ad12xlarge       then "m5ad.12xlarge"
              when AEC::InstanceType::M5ad16xlarge       then "m5ad.16xlarge"
              when AEC::InstanceType::M5ad24xlarge       then "m5ad.24xlarge"
              when AEC::InstanceType::M5dLarge           then "m5d.large"
              when AEC::InstanceType::M5dXlarge          then "m5d.xlarge"
              when AEC::InstanceType::M5d2xlarge         then "m5d.2xlarge"
              when AEC::InstanceType::M5d4xlarge         then "m5d.4xlarge"
              when AEC::InstanceType::M5d8xlarge         then "m5d.8xlarge"
              when AEC::InstanceType::M5d12xlarge        then "m5d.12xlarge"
              when AEC::InstanceType::M5d16xlarge        then "m5d.16xlarge"
              when AEC::InstanceType::M5d24xlarge        then "m5d.24xlarge"
              when AEC::InstanceType::M5dMetal           then "m5d.metal"
              when AEC::InstanceType::M5dnLarge          then "m5dn.large"
              when AEC::InstanceType::M5dnXlarge         then "m5dn.xlarge"
              when AEC::InstanceType::M5dn2xlarge        then "m5dn.2xlarge"
              when AEC::InstanceType::M5dn4xlarge        then "m5dn.4xlarge"
              when AEC::InstanceType::M5dn8xlarge        then "m5dn.8xlarge"
              when AEC::InstanceType::M5dn12xlarge       then "m5dn.12xlarge"
              when AEC::InstanceType::M5dn16xlarge       then "m5dn.16xlarge"
              when AEC::InstanceType::M5dn24xlarge       then "m5dn.24xlarge"
              when AEC::InstanceType::M5dnMetal          then "m5dn.metal"
              when AEC::InstanceType::M5nLarge           then "m5n.large"
              when AEC::InstanceType::M5nXlarge          then "m5n.xlarge"
              when AEC::InstanceType::M5n2xlarge         then "m5n.2xlarge"
              when AEC::InstanceType::M5n4xlarge         then "m5n.4xlarge"
              when AEC::InstanceType::M5n8xlarge         then "m5n.8xlarge"
              when AEC::InstanceType::M5n12xlarge        then "m5n.12xlarge"
              when AEC::InstanceType::M5n16xlarge        then "m5n.16xlarge"
              when AEC::InstanceType::M5n24xlarge        then "m5n.24xlarge"
              when AEC::InstanceType::M5nMetal           then "m5n.metal"
              when AEC::InstanceType::M5znLarge          then "m5zn.large"
              when AEC::InstanceType::M5znXlarge         then "m5zn.xlarge"
              when AEC::InstanceType::M5zn2xlarge        then "m5zn.2xlarge"
              when AEC::InstanceType::M5zn3xlarge        then "m5zn.3xlarge"
              when AEC::InstanceType::M5zn6xlarge        then "m5zn.6xlarge"
              when AEC::InstanceType::M5zn12xlarge       then "m5zn.12xlarge"
              when AEC::InstanceType::M5znMetal          then "m5zn.metal"
              when AEC::InstanceType::M6aLarge           then "m6a.large"
              when AEC::InstanceType::M6aXlarge          then "m6a.xlarge"
              when AEC::InstanceType::M6a2xlarge         then "m6a.2xlarge"
              when AEC::InstanceType::M6a4xlarge         then "m6a.4xlarge"
              when AEC::InstanceType::M6a8xlarge         then "m6a.8xlarge"
              when AEC::InstanceType::M6a12xlarge        then "m6a.12xlarge"
              when AEC::InstanceType::M6a16xlarge        then "m6a.16xlarge"
              when AEC::InstanceType::M6a24xlarge        then "m6a.24xlarge"
              when AEC::InstanceType::M6a32xlarge        then "m6a.32xlarge"
              when AEC::InstanceType::M6a48xlarge        then "m6a.48xlarge"
              when AEC::InstanceType::M6gMetal           then "m6g.metal"
              when AEC::InstanceType::M6gMedium          then "m6g.medium"
              when AEC::InstanceType::M6gLarge           then "m6g.large"
              when AEC::InstanceType::M6gXlarge          then "m6g.xlarge"
              when AEC::InstanceType::M6g2xlarge         then "m6g.2xlarge"
              when AEC::InstanceType::M6g4xlarge         then "m6g.4xlarge"
              when AEC::InstanceType::M6g8xlarge         then "m6g.8xlarge"
              when AEC::InstanceType::M6g12xlarge        then "m6g.12xlarge"
              when AEC::InstanceType::M6g16xlarge        then "m6g.16xlarge"
              when AEC::InstanceType::M6gdMetal          then "m6gd.metal"
              when AEC::InstanceType::M6gdMedium         then "m6gd.medium"
              when AEC::InstanceType::M6gdLarge          then "m6gd.large"
              when AEC::InstanceType::M6gdXlarge         then "m6gd.xlarge"
              when AEC::InstanceType::M6gd2xlarge        then "m6gd.2xlarge"
              when AEC::InstanceType::M6gd4xlarge        then "m6gd.4xlarge"
              when AEC::InstanceType::M6gd8xlarge        then "m6gd.8xlarge"
              when AEC::InstanceType::M6gd12xlarge       then "m6gd.12xlarge"
              when AEC::InstanceType::M6gd16xlarge       then "m6gd.16xlarge"
              when AEC::InstanceType::M6iLarge           then "m6i.large"
              when AEC::InstanceType::M6iXlarge          then "m6i.xlarge"
              when AEC::InstanceType::M6i2xlarge         then "m6i.2xlarge"
              when AEC::InstanceType::M6i4xlarge         then "m6i.4xlarge"
              when AEC::InstanceType::M6i8xlarge         then "m6i.8xlarge"
              when AEC::InstanceType::M6i12xlarge        then "m6i.12xlarge"
              when AEC::InstanceType::M6i16xlarge        then "m6i.16xlarge"
              when AEC::InstanceType::M6i24xlarge        then "m6i.24xlarge"
              when AEC::InstanceType::M6i32xlarge        then "m6i.32xlarge"
              when AEC::InstanceType::M6iMetal           then "m6i.metal"
              when AEC::InstanceType::Mac1Metal          then "mac1.metal"
              when AEC::InstanceType::P2Xlarge           then "p2.xlarge"
              when AEC::InstanceType::P28xlarge          then "p2.8xlarge"
              when AEC::InstanceType::P216xlarge         then "p2.16xlarge"
              when AEC::InstanceType::P32xlarge          then "p3.2xlarge"
              when AEC::InstanceType::P38xlarge          then "p3.8xlarge"
              when AEC::InstanceType::P316xlarge         then "p3.16xlarge"
              when AEC::InstanceType::P3dn24xlarge       then "p3dn.24xlarge"
              when AEC::InstanceType::P4d24xlarge        then "p4d.24xlarge"
              when AEC::InstanceType::R3Large            then "r3.large"
              when AEC::InstanceType::R3Xlarge           then "r3.xlarge"
              when AEC::InstanceType::R32xlarge          then "r3.2xlarge"
              when AEC::InstanceType::R34xlarge          then "r3.4xlarge"
              when AEC::InstanceType::R38xlarge          then "r3.8xlarge"
              when AEC::InstanceType::R4Large            then "r4.large"
              when AEC::InstanceType::R4Xlarge           then "r4.xlarge"
              when AEC::InstanceType::R42xlarge          then "r4.2xlarge"
              when AEC::InstanceType::R44xlarge          then "r4.4xlarge"
              when AEC::InstanceType::R48xlarge          then "r4.8xlarge"
              when AEC::InstanceType::R416xlarge         then "r4.16xlarge"
              when AEC::InstanceType::R5Large            then "r5.large"
              when AEC::InstanceType::R5Xlarge           then "r5.xlarge"
              when AEC::InstanceType::R52xlarge          then "r5.2xlarge"
              when AEC::InstanceType::R54xlarge          then "r5.4xlarge"
              when AEC::InstanceType::R58xlarge          then "r5.8xlarge"
              when AEC::InstanceType::R512xlarge         then "r5.12xlarge"
              when AEC::InstanceType::R516xlarge         then "r5.16xlarge"
              when AEC::InstanceType::R524xlarge         then "r5.24xlarge"
              when AEC::InstanceType::R5Metal            then "r5.metal"
              when AEC::InstanceType::R5aLarge           then "r5a.large"
              when AEC::InstanceType::R5aXlarge          then "r5a.xlarge"
              when AEC::InstanceType::R5a2xlarge         then "r5a.2xlarge"
              when AEC::InstanceType::R5a4xlarge         then "r5a.4xlarge"
              when AEC::InstanceType::R5a8xlarge         then "r5a.8xlarge"
              when AEC::InstanceType::R5a12xlarge        then "r5a.12xlarge"
              when AEC::InstanceType::R5a16xlarge        then "r5a.16xlarge"
              when AEC::InstanceType::R5a24xlarge        then "r5a.24xlarge"
              when AEC::InstanceType::R5adLarge          then "r5ad.large"
              when AEC::InstanceType::R5adXlarge         then "r5ad.xlarge"
              when AEC::InstanceType::R5ad2xlarge        then "r5ad.2xlarge"
              when AEC::InstanceType::R5ad4xlarge        then "r5ad.4xlarge"
              when AEC::InstanceType::R5ad8xlarge        then "r5ad.8xlarge"
              when AEC::InstanceType::R5ad12xlarge       then "r5ad.12xlarge"
              when AEC::InstanceType::R5ad16xlarge       then "r5ad.16xlarge"
              when AEC::InstanceType::R5ad24xlarge       then "r5ad.24xlarge"
              when AEC::InstanceType::R5bLarge           then "r5b.large"
              when AEC::InstanceType::R5bXlarge          then "r5b.xlarge"
              when AEC::InstanceType::R5b2xlarge         then "r5b.2xlarge"
              when AEC::InstanceType::R5b4xlarge         then "r5b.4xlarge"
              when AEC::InstanceType::R5b8xlarge         then "r5b.8xlarge"
              when AEC::InstanceType::R5b12xlarge        then "r5b.12xlarge"
              when AEC::InstanceType::R5b16xlarge        then "r5b.16xlarge"
              when AEC::InstanceType::R5b24xlarge        then "r5b.24xlarge"
              when AEC::InstanceType::R5bMetal           then "r5b.metal"
              when AEC::InstanceType::R5dLarge           then "r5d.large"
              when AEC::InstanceType::R5dXlarge          then "r5d.xlarge"
              when AEC::InstanceType::R5d2xlarge         then "r5d.2xlarge"
              when AEC::InstanceType::R5d4xlarge         then "r5d.4xlarge"
              when AEC::InstanceType::R5d8xlarge         then "r5d.8xlarge"
              when AEC::InstanceType::R5d12xlarge        then "r5d.12xlarge"
              when AEC::InstanceType::R5d16xlarge        then "r5d.16xlarge"
              when AEC::InstanceType::R5d24xlarge        then "r5d.24xlarge"
              when AEC::InstanceType::R5dMetal           then "r5d.metal"
              when AEC::InstanceType::R5dnLarge          then "r5dn.large"
              when AEC::InstanceType::R5dnXlarge         then "r5dn.xlarge"
              when AEC::InstanceType::R5dn2xlarge        then "r5dn.2xlarge"
              when AEC::InstanceType::R5dn4xlarge        then "r5dn.4xlarge"
              when AEC::InstanceType::R5dn8xlarge        then "r5dn.8xlarge"
              when AEC::InstanceType::R5dn12xlarge       then "r5dn.12xlarge"
              when AEC::InstanceType::R5dn16xlarge       then "r5dn.16xlarge"
              when AEC::InstanceType::R5dn24xlarge       then "r5dn.24xlarge"
              when AEC::InstanceType::R5dnMetal          then "r5dn.metal"
              when AEC::InstanceType::R5nLarge           then "r5n.large"
              when AEC::InstanceType::R5nXlarge          then "r5n.xlarge"
              when AEC::InstanceType::R5n2xlarge         then "r5n.2xlarge"
              when AEC::InstanceType::R5n4xlarge         then "r5n.4xlarge"
              when AEC::InstanceType::R5n8xlarge         then "r5n.8xlarge"
              when AEC::InstanceType::R5n12xlarge        then "r5n.12xlarge"
              when AEC::InstanceType::R5n16xlarge        then "r5n.16xlarge"
              when AEC::InstanceType::R5n24xlarge        then "r5n.24xlarge"
              when AEC::InstanceType::R5nMetal           then "r5n.metal"
              when AEC::InstanceType::R6gMedium          then "r6g.medium"
              when AEC::InstanceType::R6gLarge           then "r6g.large"
              when AEC::InstanceType::R6gXlarge          then "r6g.xlarge"
              when AEC::InstanceType::R6g2xlarge         then "r6g.2xlarge"
              when AEC::InstanceType::R6g4xlarge         then "r6g.4xlarge"
              when AEC::InstanceType::R6g8xlarge         then "r6g.8xlarge"
              when AEC::InstanceType::R6g12xlarge        then "r6g.12xlarge"
              when AEC::InstanceType::R6g16xlarge        then "r6g.16xlarge"
              when AEC::InstanceType::R6gMetal           then "r6g.metal"
              when AEC::InstanceType::R6gdMedium         then "r6gd.medium"
              when AEC::InstanceType::R6gdLarge          then "r6gd.large"
              when AEC::InstanceType::R6gdXlarge         then "r6gd.xlarge"
              when AEC::InstanceType::R6gd2xlarge        then "r6gd.2xlarge"
              when AEC::InstanceType::R6gd4xlarge        then "r6gd.4xlarge"
              when AEC::InstanceType::R6gd8xlarge        then "r6gd.8xlarge"
              when AEC::InstanceType::R6gd12xlarge       then "r6gd.12xlarge"
              when AEC::InstanceType::R6gd16xlarge       then "r6gd.16xlarge"
              when AEC::InstanceType::R6gdMetal          then "r6gd.metal"
              when AEC::InstanceType::R6iLarge           then "r6i.large"
              when AEC::InstanceType::R6iXlarge          then "r6i.xlarge"
              when AEC::InstanceType::R6i2xlarge         then "r6i.2xlarge"
              when AEC::InstanceType::R6i4xlarge         then "r6i.4xlarge"
              when AEC::InstanceType::R6i8xlarge         then "r6i.8xlarge"
              when AEC::InstanceType::R6i12xlarge        then "r6i.12xlarge"
              when AEC::InstanceType::R6i16xlarge        then "r6i.16xlarge"
              when AEC::InstanceType::R6i24xlarge        then "r6i.24xlarge"
              when AEC::InstanceType::R6i32xlarge        then "r6i.32xlarge"
              when AEC::InstanceType::R6iMetal           then "r6i.metal"
              when AEC::InstanceType::T1Micro            then "t1.micro"
              when AEC::InstanceType::T2Nano             then "t2.nano"
              when AEC::InstanceType::T2Micro            then "t2.micro"
              when AEC::InstanceType::T2Small            then "t2.small"
              when AEC::InstanceType::T2Medium           then "t2.medium"
              when AEC::InstanceType::T2Large            then "t2.large"
              when AEC::InstanceType::T2Xlarge           then "t2.xlarge"
              when AEC::InstanceType::T22xlarge          then "t2.2xlarge"
              when AEC::InstanceType::T3Nano             then "t3.nano"
              when AEC::InstanceType::T3Micro            then "t3.micro"
              when AEC::InstanceType::T3Small            then "t3.small"
              when AEC::InstanceType::T3Medium           then "t3.medium"
              when AEC::InstanceType::T3Large            then "t3.large"
              when AEC::InstanceType::T3Xlarge           then "t3.xlarge"
              when AEC::InstanceType::T32xlarge          then "t3.2xlarge"
              when AEC::InstanceType::T3aNano            then "t3a.nano"
              when AEC::InstanceType::T3aMicro           then "t3a.micro"
              when AEC::InstanceType::T3aSmall           then "t3a.small"
              when AEC::InstanceType::T3aMedium          then "t3a.medium"
              when AEC::InstanceType::T3aLarge           then "t3a.large"
              when AEC::InstanceType::T3aXlarge          then "t3a.xlarge"
              when AEC::InstanceType::T3a2xlarge         then "t3a.2xlarge"
              when AEC::InstanceType::T4gNano            then "t4g.nano"
              when AEC::InstanceType::T4gMicro           then "t4g.micro"
              when AEC::InstanceType::T4gSmall           then "t4g.small"
              when AEC::InstanceType::T4gMedium          then "t4g.medium"
              when AEC::InstanceType::T4gLarge           then "t4g.large"
              when AEC::InstanceType::T4gXlarge          then "t4g.xlarge"
              when AEC::InstanceType::T4g2xlarge         then "t4g.2xlarge"
              when AEC::InstanceType::U6tb156xlarge      then "u-6tb1.56xlarge"
              when AEC::InstanceType::U6tb1112xlarge     then "u-6tb1.112xlarge"
              when AEC::InstanceType::U9tb1112xlarge     then "u-9tb1.112xlarge"
              when AEC::InstanceType::U12tb1112xlarge    then "u-12tb1.112xlarge"
              when AEC::InstanceType::U6tb1Metal         then "u-6tb1.metal"
              when AEC::InstanceType::U9tb1Metal         then "u-9tb1.metal"
              when AEC::InstanceType::U12tb1Metal        then "u-12tb1.metal"
              when AEC::InstanceType::U18tb1Metal        then "u-18tb1.metal"
              when AEC::InstanceType::U24tb1Metal        then "u-24tb1.metal"
              when AEC::InstanceType::Vt13xlarge         then "vt1.3xlarge"
              when AEC::InstanceType::Vt16xlarge         then "vt1.6xlarge"
              when AEC::InstanceType::Vt124xlarge        then "vt1.24xlarge"
              when AEC::InstanceType::X116xlarge         then "x1.16xlarge"
              when AEC::InstanceType::X132xlarge         then "x1.32xlarge"
              when AEC::InstanceType::X1eXlarge          then "x1e.xlarge"
              when AEC::InstanceType::X1e2xlarge         then "x1e.2xlarge"
              when AEC::InstanceType::X1e4xlarge         then "x1e.4xlarge"
              when AEC::InstanceType::X1e8xlarge         then "x1e.8xlarge"
              when AEC::InstanceType::X1e16xlarge        then "x1e.16xlarge"
              when AEC::InstanceType::X1e32xlarge        then "x1e.32xlarge"
              when AEC::InstanceType::X2iezn2xlarge      then "x2iezn.2xlarge"
              when AEC::InstanceType::X2iezn4xlarge      then "x2iezn.4xlarge"
              when AEC::InstanceType::X2iezn6xlarge      then "x2iezn.6xlarge"
              when AEC::InstanceType::X2iezn8xlarge      then "x2iezn.8xlarge"
              when AEC::InstanceType::X2iezn12xlarge     then "x2iezn.12xlarge"
              when AEC::InstanceType::X2ieznMetal        then "x2iezn.metal"
              when AEC::InstanceType::X2gdMedium         then "x2gd.medium"
              when AEC::InstanceType::X2gdLarge          then "x2gd.large"
              when AEC::InstanceType::X2gdXlarge         then "x2gd.xlarge"
              when AEC::InstanceType::X2gd2xlarge        then "x2gd.2xlarge"
              when AEC::InstanceType::X2gd4xlarge        then "x2gd.4xlarge"
              when AEC::InstanceType::X2gd8xlarge        then "x2gd.8xlarge"
              when AEC::InstanceType::X2gd12xlarge       then "x2gd.12xlarge"
              when AEC::InstanceType::X2gd16xlarge       then "x2gd.16xlarge"
              when AEC::InstanceType::X2gdMetal          then "x2gd.metal"
              when AEC::InstanceType::Z1dLarge           then "z1d.large"
              when AEC::InstanceType::Z1dXlarge          then "z1d.xlarge"
              when AEC::InstanceType::Z1d2xlarge         then "z1d.2xlarge"
              when AEC::InstanceType::Z1d3xlarge         then "z1d.3xlarge"
              when AEC::InstanceType::Z1d6xlarge         then "z1d.6xlarge"
              when AEC::InstanceType::Z1d12xlarge        then "z1d.12xlarge"
              when AEC::InstanceType::Z1dMetal           then "z1d.metal"
              when AEC::InstanceType::X2idn16xlarge      then "x2idn.16xlarge"
              when AEC::InstanceType::X2idn24xlarge      then "x2idn.24xlarge"
              when AEC::InstanceType::X2idn32xlarge      then "x2idn.32xlarge"
              when AEC::InstanceType::X2iednXlarge       then "x2iedn.xlarge"
              when AEC::InstanceType::X2iedn2xlarge      then "x2iedn.2xlarge"
              when AEC::InstanceType::X2iedn4xlarge      then "x2iedn.4xlarge"
              when AEC::InstanceType::X2iedn8xlarge      then "x2iedn.8xlarge"
              when AEC::InstanceType::X2iedn16xlarge     then "x2iedn.16xlarge"
              when AEC::InstanceType::X2iedn24xlarge     then "x2iedn.24xlarge"
              when AEC::InstanceType::X2iedn32xlarge     then "x2iedn.32xlarge"
              when AEC::InstanceType::C6aLarge           then "c6a.large"
              when AEC::InstanceType::C6aXlarge          then "c6a.xlarge"
              when AEC::InstanceType::C6a2xlarge         then "c6a.2xlarge"
              when AEC::InstanceType::C6a4xlarge         then "c6a.4xlarge"
              when AEC::InstanceType::C6a8xlarge         then "c6a.8xlarge"
              when AEC::InstanceType::C6a12xlarge        then "c6a.12xlarge"
              when AEC::InstanceType::C6a16xlarge        then "c6a.16xlarge"
              when AEC::InstanceType::C6a24xlarge        then "c6a.24xlarge"
              when AEC::InstanceType::C6a32xlarge        then "c6a.32xlarge"
              when AEC::InstanceType::C6a48xlarge        then "c6a.48xlarge"
              when AEC::InstanceType::C6aMetal           then "c6a.metal"
              when AEC::InstanceType::M6aMetal           then "m6a.metal"
              when AEC::InstanceType::I4iLarge           then "i4i.large"
              when AEC::InstanceType::I4iXlarge          then "i4i.xlarge"
              when AEC::InstanceType::I4i2xlarge         then "i4i.2xlarge"
              when AEC::InstanceType::I4i4xlarge         then "i4i.4xlarge"
              when AEC::InstanceType::I4i8xlarge         then "i4i.8xlarge"
              when AEC::InstanceType::I4i16xlarge        then "i4i.16xlarge"
              when AEC::InstanceType::I4i32xlarge        then "i4i.32xlarge"
              when AEC::InstanceType::I4iMetal           then "i4i.metal"
              when AEC::InstanceType::X2idnMetal         then "x2idn.metal"
              when AEC::InstanceType::X2iednMetal        then "x2iedn.metal"
              when AEC::InstanceType::C7gMedium          then "c7g.medium"
              when AEC::InstanceType::C7gLarge           then "c7g.large"
              when AEC::InstanceType::C7gXlarge          then "c7g.xlarge"
              when AEC::InstanceType::C7g2xlarge         then "c7g.2xlarge"
              when AEC::InstanceType::C7g4xlarge         then "c7g.4xlarge"
              when AEC::InstanceType::C7g8xlarge         then "c7g.8xlarge"
              when AEC::InstanceType::C7g12xlarge        then "c7g.12xlarge"
              when AEC::InstanceType::C7g16xlarge        then "c7g.16xlarge"
              when AEC::InstanceType::Mac2Metal          then "mac2.metal"
              when AEC::InstanceType::C6idLarge          then "c6id.large"
              when AEC::InstanceType::C6idXlarge         then "c6id.xlarge"
              when AEC::InstanceType::C6id2xlarge        then "c6id.2xlarge"
              when AEC::InstanceType::C6id4xlarge        then "c6id.4xlarge"
              when AEC::InstanceType::C6id8xlarge        then "c6id.8xlarge"
              when AEC::InstanceType::C6id12xlarge       then "c6id.12xlarge"
              when AEC::InstanceType::C6id16xlarge       then "c6id.16xlarge"
              when AEC::InstanceType::C6id24xlarge       then "c6id.24xlarge"
              when AEC::InstanceType::C6id32xlarge       then "c6id.32xlarge"
              when AEC::InstanceType::C6idMetal          then "c6id.metal"
              when AEC::InstanceType::M6idLarge          then "m6id.large"
              when AEC::InstanceType::M6idXlarge         then "m6id.xlarge"
              when AEC::InstanceType::M6id2xlarge        then "m6id.2xlarge"
              when AEC::InstanceType::M6id4xlarge        then "m6id.4xlarge"
              when AEC::InstanceType::M6id8xlarge        then "m6id.8xlarge"
              when AEC::InstanceType::M6id12xlarge       then "m6id.12xlarge"
              when AEC::InstanceType::M6id16xlarge       then "m6id.16xlarge"
              when AEC::InstanceType::M6id24xlarge       then "m6id.24xlarge"
              when AEC::InstanceType::M6id32xlarge       then "m6id.32xlarge"
              when AEC::InstanceType::M6idMetal          then "m6id.metal"
              when AEC::InstanceType::R6idLarge          then "r6id.large"
              when AEC::InstanceType::R6idXlarge         then "r6id.xlarge"
              when AEC::InstanceType::R6id2xlarge        then "r6id.2xlarge"
              when AEC::InstanceType::R6id4xlarge        then "r6id.4xlarge"
              when AEC::InstanceType::R6id8xlarge        then "r6id.8xlarge"
              when AEC::InstanceType::R6id12xlarge       then "r6id.12xlarge"
              when AEC::InstanceType::R6id16xlarge       then "r6id.16xlarge"
              when AEC::InstanceType::R6id24xlarge       then "r6id.24xlarge"
              when AEC::InstanceType::R6id32xlarge       then "r6id.32xlarge"
              when AEC::InstanceType::R6idMetal          then "r6id.metal"
              when AEC::InstanceType::R6aLarge           then "r6a.large"
              when AEC::InstanceType::R6aXlarge          then "r6a.xlarge"
              when AEC::InstanceType::R6a2xlarge         then "r6a.2xlarge"
              when AEC::InstanceType::R6a4xlarge         then "r6a.4xlarge"
              when AEC::InstanceType::R6a8xlarge         then "r6a.8xlarge"
              when AEC::InstanceType::R6a12xlarge        then "r6a.12xlarge"
              when AEC::InstanceType::R6a16xlarge        then "r6a.16xlarge"
              when AEC::InstanceType::R6a24xlarge        then "r6a.24xlarge"
              when AEC::InstanceType::R6a32xlarge        then "r6a.32xlarge"
              when AEC::InstanceType::R6a48xlarge        then "r6a.48xlarge"
              when AEC::InstanceType::R6aMetal           then "r6a.metal"
              when AEC::InstanceType::P4de24xlarge       then "p4de.24xlarge"
              when AEC::InstanceType::U3tb156xlarge      then "u-3tb1.56xlarge"
              when AEC::InstanceType::U18tb1112xlarge    then "u-18tb1.112xlarge"
              when AEC::InstanceType::U24tb1112xlarge    then "u-24tb1.112xlarge"
              when AEC::InstanceType::Trn12xlarge        then "trn1.2xlarge"
              when AEC::InstanceType::Trn132xlarge       then "trn1.32xlarge"
              when AEC::InstanceType::Hpc6id32xlarge     then "hpc6id.32xlarge"
              when AEC::InstanceType::C6inLarge          then "c6in.large"
              when AEC::InstanceType::C6inXlarge         then "c6in.xlarge"
              when AEC::InstanceType::C6in2xlarge        then "c6in.2xlarge"
              when AEC::InstanceType::C6in4xlarge        then "c6in.4xlarge"
              when AEC::InstanceType::C6in8xlarge        then "c6in.8xlarge"
              when AEC::InstanceType::C6in12xlarge       then "c6in.12xlarge"
              when AEC::InstanceType::C6in16xlarge       then "c6in.16xlarge"
              when AEC::InstanceType::C6in24xlarge       then "c6in.24xlarge"
              when AEC::InstanceType::C6in32xlarge       then "c6in.32xlarge"
              when AEC::InstanceType::M6inLarge          then "m6in.large"
              when AEC::InstanceType::M6inXlarge         then "m6in.xlarge"
              when AEC::InstanceType::M6in2xlarge        then "m6in.2xlarge"
              when AEC::InstanceType::M6in4xlarge        then "m6in.4xlarge"
              when AEC::InstanceType::M6in8xlarge        then "m6in.8xlarge"
              when AEC::InstanceType::M6in12xlarge       then "m6in.12xlarge"
              when AEC::InstanceType::M6in16xlarge       then "m6in.16xlarge"
              when AEC::InstanceType::M6in24xlarge       then "m6in.24xlarge"
              when AEC::InstanceType::M6in32xlarge       then "m6in.32xlarge"
              when AEC::InstanceType::M6idnLarge         then "m6idn.large"
              when AEC::InstanceType::M6idnXlarge        then "m6idn.xlarge"
              when AEC::InstanceType::M6idn2xlarge       then "m6idn.2xlarge"
              when AEC::InstanceType::M6idn4xlarge       then "m6idn.4xlarge"
              when AEC::InstanceType::M6idn8xlarge       then "m6idn.8xlarge"
              when AEC::InstanceType::M6idn12xlarge      then "m6idn.12xlarge"
              when AEC::InstanceType::M6idn16xlarge      then "m6idn.16xlarge"
              when AEC::InstanceType::M6idn24xlarge      then "m6idn.24xlarge"
              when AEC::InstanceType::M6idn32xlarge      then "m6idn.32xlarge"
              when AEC::InstanceType::R6inLarge          then "r6in.large"
              when AEC::InstanceType::R6inXlarge         then "r6in.xlarge"
              when AEC::InstanceType::R6in2xlarge        then "r6in.2xlarge"
              when AEC::InstanceType::R6in4xlarge        then "r6in.4xlarge"
              when AEC::InstanceType::R6in8xlarge        then "r6in.8xlarge"
              when AEC::InstanceType::R6in12xlarge       then "r6in.12xlarge"
              when AEC::InstanceType::R6in16xlarge       then "r6in.16xlarge"
              when AEC::InstanceType::R6in24xlarge       then "r6in.24xlarge"
              when AEC::InstanceType::R6in32xlarge       then "r6in.32xlarge"
              when AEC::InstanceType::R6idnLarge         then "r6idn.large"
              when AEC::InstanceType::R6idnXlarge        then "r6idn.xlarge"
              when AEC::InstanceType::R6idn2xlarge       then "r6idn.2xlarge"
              when AEC::InstanceType::R6idn4xlarge       then "r6idn.4xlarge"
              when AEC::InstanceType::R6idn8xlarge       then "r6idn.8xlarge"
              when AEC::InstanceType::R6idn12xlarge      then "r6idn.12xlarge"
              when AEC::InstanceType::R6idn16xlarge      then "r6idn.16xlarge"
              when AEC::InstanceType::R6idn24xlarge      then "r6idn.24xlarge"
              when AEC::InstanceType::R6idn32xlarge      then "r6idn.32xlarge"
              when AEC::InstanceType::C7gMetal           then "c7g.metal"
              when AEC::InstanceType::M7gMedium          then "m7g.medium"
              when AEC::InstanceType::M7gLarge           then "m7g.large"
              when AEC::InstanceType::M7gXlarge          then "m7g.xlarge"
              when AEC::InstanceType::M7g2xlarge         then "m7g.2xlarge"
              when AEC::InstanceType::M7g4xlarge         then "m7g.4xlarge"
              when AEC::InstanceType::M7g8xlarge         then "m7g.8xlarge"
              when AEC::InstanceType::M7g12xlarge        then "m7g.12xlarge"
              when AEC::InstanceType::M7g16xlarge        then "m7g.16xlarge"
              when AEC::InstanceType::M7gMetal           then "m7g.metal"
              when AEC::InstanceType::R7gMedium          then "r7g.medium"
              when AEC::InstanceType::R7gLarge           then "r7g.large"
              when AEC::InstanceType::R7gXlarge          then "r7g.xlarge"
              when AEC::InstanceType::R7g2xlarge         then "r7g.2xlarge"
              when AEC::InstanceType::R7g4xlarge         then "r7g.4xlarge"
              when AEC::InstanceType::R7g8xlarge         then "r7g.8xlarge"
              when AEC::InstanceType::R7g12xlarge        then "r7g.12xlarge"
              when AEC::InstanceType::R7g16xlarge        then "r7g.16xlarge"
              when AEC::InstanceType::R7gMetal           then "r7g.metal"
              when AEC::InstanceType::C6inMetal          then "c6in.metal"
              when AEC::InstanceType::M6inMetal          then "m6in.metal"
              when AEC::InstanceType::M6idnMetal         then "m6idn.metal"
              when AEC::InstanceType::R6inMetal          then "r6in.metal"
              when AEC::InstanceType::R6idnMetal         then "r6idn.metal"
              when AEC::InstanceType::Inf2Xlarge         then "inf2.xlarge"
              when AEC::InstanceType::Inf28xlarge        then "inf2.8xlarge"
              when AEC::InstanceType::Inf224xlarge       then "inf2.24xlarge"
              when AEC::InstanceType::Inf248xlarge       then "inf2.48xlarge"
              when AEC::InstanceType::Trn1n32xlarge      then "trn1n.32xlarge"
              when AEC::InstanceType::I4gLarge           then "i4g.large"
              when AEC::InstanceType::I4gXlarge          then "i4g.xlarge"
              when AEC::InstanceType::I4g2xlarge         then "i4g.2xlarge"
              when AEC::InstanceType::I4g4xlarge         then "i4g.4xlarge"
              when AEC::InstanceType::I4g8xlarge         then "i4g.8xlarge"
              when AEC::InstanceType::I4g16xlarge        then "i4g.16xlarge"
              when AEC::InstanceType::Hpc7g4xlarge       then "hpc7g.4xlarge"
              when AEC::InstanceType::Hpc7g8xlarge       then "hpc7g.8xlarge"
              when AEC::InstanceType::Hpc7g16xlarge      then "hpc7g.16xlarge"
              when AEC::InstanceType::C7gnMedium         then "c7gn.medium"
              when AEC::InstanceType::C7gnLarge          then "c7gn.large"
              when AEC::InstanceType::C7gnXlarge         then "c7gn.xlarge"
              when AEC::InstanceType::C7gn2xlarge        then "c7gn.2xlarge"
              when AEC::InstanceType::C7gn4xlarge        then "c7gn.4xlarge"
              when AEC::InstanceType::C7gn8xlarge        then "c7gn.8xlarge"
              when AEC::InstanceType::C7gn12xlarge       then "c7gn.12xlarge"
              when AEC::InstanceType::C7gn16xlarge       then "c7gn.16xlarge"
              when AEC::InstanceType::P548xlarge         then "p5.48xlarge"
              when AEC::InstanceType::M7iLarge           then "m7i.large"
              when AEC::InstanceType::M7iXlarge          then "m7i.xlarge"
              when AEC::InstanceType::M7i2xlarge         then "m7i.2xlarge"
              when AEC::InstanceType::M7i4xlarge         then "m7i.4xlarge"
              when AEC::InstanceType::M7i8xlarge         then "m7i.8xlarge"
              when AEC::InstanceType::M7i12xlarge        then "m7i.12xlarge"
              when AEC::InstanceType::M7i16xlarge        then "m7i.16xlarge"
              when AEC::InstanceType::M7i24xlarge        then "m7i.24xlarge"
              when AEC::InstanceType::M7i48xlarge        then "m7i.48xlarge"
              when AEC::InstanceType::M7iFlexLarge       then "m7i-flex.large"
              when AEC::InstanceType::M7iFlexXlarge      then "m7i-flex.xlarge"
              when AEC::InstanceType::M7iFlex2xlarge     then "m7i-flex.2xlarge"
              when AEC::InstanceType::M7iFlex4xlarge     then "m7i-flex.4xlarge"
              when AEC::InstanceType::M7iFlex8xlarge     then "m7i-flex.8xlarge"
              when AEC::InstanceType::M7aMedium          then "m7a.medium"
              when AEC::InstanceType::M7aLarge           then "m7a.large"
              when AEC::InstanceType::M7aXlarge          then "m7a.xlarge"
              when AEC::InstanceType::M7a2xlarge         then "m7a.2xlarge"
              when AEC::InstanceType::M7a4xlarge         then "m7a.4xlarge"
              when AEC::InstanceType::M7a8xlarge         then "m7a.8xlarge"
              when AEC::InstanceType::M7a12xlarge        then "m7a.12xlarge"
              when AEC::InstanceType::M7a16xlarge        then "m7a.16xlarge"
              when AEC::InstanceType::M7a24xlarge        then "m7a.24xlarge"
              when AEC::InstanceType::M7a32xlarge        then "m7a.32xlarge"
              when AEC::InstanceType::M7a48xlarge        then "m7a.48xlarge"
              when AEC::InstanceType::M7aMetal48xl       then "m7a.metal-48xl"
              when AEC::InstanceType::Hpc7a12xlarge      then "hpc7a.12xlarge"
              when AEC::InstanceType::Hpc7a24xlarge      then "hpc7a.24xlarge"
              when AEC::InstanceType::Hpc7a48xlarge      then "hpc7a.48xlarge"
              when AEC::InstanceType::Hpc7a96xlarge      then "hpc7a.96xlarge"
              when AEC::InstanceType::C7gdMedium         then "c7gd.medium"
              when AEC::InstanceType::C7gdLarge          then "c7gd.large"
              when AEC::InstanceType::C7gdXlarge         then "c7gd.xlarge"
              when AEC::InstanceType::C7gd2xlarge        then "c7gd.2xlarge"
              when AEC::InstanceType::C7gd4xlarge        then "c7gd.4xlarge"
              when AEC::InstanceType::C7gd8xlarge        then "c7gd.8xlarge"
              when AEC::InstanceType::C7gd12xlarge       then "c7gd.12xlarge"
              when AEC::InstanceType::C7gd16xlarge       then "c7gd.16xlarge"
              when AEC::InstanceType::M7gdMedium         then "m7gd.medium"
              when AEC::InstanceType::M7gdLarge          then "m7gd.large"
              when AEC::InstanceType::M7gdXlarge         then "m7gd.xlarge"
              when AEC::InstanceType::M7gd2xlarge        then "m7gd.2xlarge"
              when AEC::InstanceType::M7gd4xlarge        then "m7gd.4xlarge"
              when AEC::InstanceType::M7gd8xlarge        then "m7gd.8xlarge"
              when AEC::InstanceType::M7gd12xlarge       then "m7gd.12xlarge"
              when AEC::InstanceType::M7gd16xlarge       then "m7gd.16xlarge"
              when AEC::InstanceType::R7gdMedium         then "r7gd.medium"
              when AEC::InstanceType::R7gdLarge          then "r7gd.large"
              when AEC::InstanceType::R7gdXlarge         then "r7gd.xlarge"
              when AEC::InstanceType::R7gd2xlarge        then "r7gd.2xlarge"
              when AEC::InstanceType::R7gd4xlarge        then "r7gd.4xlarge"
              when AEC::InstanceType::R7gd8xlarge        then "r7gd.8xlarge"
              when AEC::InstanceType::R7gd12xlarge       then "r7gd.12xlarge"
              when AEC::InstanceType::R7gd16xlarge       then "r7gd.16xlarge"
              when AEC::InstanceType::R7aMedium          then "r7a.medium"
              when AEC::InstanceType::R7aLarge           then "r7a.large"
              when AEC::InstanceType::R7aXlarge          then "r7a.xlarge"
              when AEC::InstanceType::R7a2xlarge         then "r7a.2xlarge"
              when AEC::InstanceType::R7a4xlarge         then "r7a.4xlarge"
              when AEC::InstanceType::R7a8xlarge         then "r7a.8xlarge"
              when AEC::InstanceType::R7a12xlarge        then "r7a.12xlarge"
              when AEC::InstanceType::R7a16xlarge        then "r7a.16xlarge"
              when AEC::InstanceType::R7a24xlarge        then "r7a.24xlarge"
              when AEC::InstanceType::R7a32xlarge        then "r7a.32xlarge"
              when AEC::InstanceType::R7a48xlarge        then "r7a.48xlarge"
              when AEC::InstanceType::C7iLarge           then "c7i.large"
              when AEC::InstanceType::C7iXlarge          then "c7i.xlarge"
              when AEC::InstanceType::C7i2xlarge         then "c7i.2xlarge"
              when AEC::InstanceType::C7i4xlarge         then "c7i.4xlarge"
              when AEC::InstanceType::C7i8xlarge         then "c7i.8xlarge"
              when AEC::InstanceType::C7i12xlarge        then "c7i.12xlarge"
              when AEC::InstanceType::C7i16xlarge        then "c7i.16xlarge"
              when AEC::InstanceType::C7i24xlarge        then "c7i.24xlarge"
              when AEC::InstanceType::C7i48xlarge        then "c7i.48xlarge"
              when AEC::InstanceType::Mac2M2proMetal     then "mac2-m2pro.metal"
              when AEC::InstanceType::R7izLarge          then "r7iz.large"
              when AEC::InstanceType::R7izXlarge         then "r7iz.xlarge"
              when AEC::InstanceType::R7iz2xlarge        then "r7iz.2xlarge"
              when AEC::InstanceType::R7iz4xlarge        then "r7iz.4xlarge"
              when AEC::InstanceType::R7iz8xlarge        then "r7iz.8xlarge"
              when AEC::InstanceType::R7iz12xlarge       then "r7iz.12xlarge"
              when AEC::InstanceType::R7iz16xlarge       then "r7iz.16xlarge"
              when AEC::InstanceType::R7iz32xlarge       then "r7iz.32xlarge"
              when AEC::InstanceType::C7aMedium          then "c7a.medium"
              when AEC::InstanceType::C7aLarge           then "c7a.large"
              when AEC::InstanceType::C7aXlarge          then "c7a.xlarge"
              when AEC::InstanceType::C7a2xlarge         then "c7a.2xlarge"
              when AEC::InstanceType::C7a4xlarge         then "c7a.4xlarge"
              when AEC::InstanceType::C7a8xlarge         then "c7a.8xlarge"
              when AEC::InstanceType::C7a12xlarge        then "c7a.12xlarge"
              when AEC::InstanceType::C7a16xlarge        then "c7a.16xlarge"
              when AEC::InstanceType::C7a24xlarge        then "c7a.24xlarge"
              when AEC::InstanceType::C7a32xlarge        then "c7a.32xlarge"
              when AEC::InstanceType::C7a48xlarge        then "c7a.48xlarge"
              when AEC::InstanceType::C7aMetal48xl       then "c7a.metal-48xl"
              when AEC::InstanceType::R7aMetal48xl       then "r7a.metal-48xl"
              when AEC::InstanceType::R7iLarge           then "r7i.large"
              when AEC::InstanceType::R7iXlarge          then "r7i.xlarge"
              when AEC::InstanceType::R7i2xlarge         then "r7i.2xlarge"
              when AEC::InstanceType::R7i4xlarge         then "r7i.4xlarge"
              when AEC::InstanceType::R7i8xlarge         then "r7i.8xlarge"
              when AEC::InstanceType::R7i12xlarge        then "r7i.12xlarge"
              when AEC::InstanceType::R7i16xlarge        then "r7i.16xlarge"
              when AEC::InstanceType::R7i24xlarge        then "r7i.24xlarge"
              when AEC::InstanceType::R7i48xlarge        then "r7i.48xlarge"
              when AEC::InstanceType::Dl2q24xlarge       then "dl2q.24xlarge"
              when AEC::InstanceType::Mac2M2Metal        then "mac2-m2.metal"
              when AEC::InstanceType::I4i12xlarge        then "i4i.12xlarge"
              when AEC::InstanceType::I4i24xlarge        then "i4i.24xlarge"
              when AEC::InstanceType::C7iMetal24xl       then "c7i.metal-24xl"
              when AEC::InstanceType::C7iMetal48xl       then "c7i.metal-48xl"
              when AEC::InstanceType::M7iMetal24xl       then "m7i.metal-24xl"
              when AEC::InstanceType::M7iMetal48xl       then "m7i.metal-48xl"
              when AEC::InstanceType::R7iMetal24xl       then "r7i.metal-24xl"
              when AEC::InstanceType::R7iMetal48xl       then "r7i.metal-48xl"
              when AEC::InstanceType::R7izMetal16xl      then "r7iz.metal-16xl"
              when AEC::InstanceType::R7izMetal32xl      then "r7iz.metal-32xl"
              when AEC::InstanceType::C7gdMetal          then "c7gd.metal"
              when AEC::InstanceType::M7gdMetal          then "m7gd.metal"
              when AEC::InstanceType::R7gdMetal          then "r7gd.metal"
              when AEC::InstanceType::G6Xlarge           then "g6.xlarge"
              when AEC::InstanceType::G62xlarge          then "g6.2xlarge"
              when AEC::InstanceType::G64xlarge          then "g6.4xlarge"
              when AEC::InstanceType::G68xlarge          then "g6.8xlarge"
              when AEC::InstanceType::G612xlarge         then "g6.12xlarge"
              when AEC::InstanceType::G616xlarge         then "g6.16xlarge"
              when AEC::InstanceType::G624xlarge         then "g6.24xlarge"
              when AEC::InstanceType::G648xlarge         then "g6.48xlarge"
              when AEC::InstanceType::Gr64xlarge         then "gr6.4xlarge"
              when AEC::InstanceType::Gr68xlarge         then "gr6.8xlarge"
              when AEC::InstanceType::C7iFlexLarge       then "c7i-flex.large"
              when AEC::InstanceType::C7iFlexXlarge      then "c7i-flex.xlarge"
              when AEC::InstanceType::C7iFlex2xlarge     then "c7i-flex.2xlarge"
              when AEC::InstanceType::C7iFlex4xlarge     then "c7i-flex.4xlarge"
              when AEC::InstanceType::C7iFlex8xlarge     then "c7i-flex.8xlarge"
              when AEC::InstanceType::U7i12tb224xlarge   then "u7i-12tb.224xlarge"
              when AEC::InstanceType::U7in16tb224xlarge  then "u7in-16tb.224xlarge"
              when AEC::InstanceType::U7in24tb224xlarge  then "u7in-24tb.224xlarge"
              when AEC::InstanceType::U7in32tb224xlarge  then "u7in-32tb.224xlarge"
              when AEC::InstanceType::U7ib12tb224xlarge  then "u7ib-12tb.224xlarge"
              when AEC::InstanceType::C7gnMetal          then "c7gn.metal"
              when AEC::InstanceType::R8gMedium          then "r8g.medium"
              when AEC::InstanceType::R8gLarge           then "r8g.large"
              when AEC::InstanceType::R8gXlarge          then "r8g.xlarge"
              when AEC::InstanceType::R8g2xlarge         then "r8g.2xlarge"
              when AEC::InstanceType::R8g4xlarge         then "r8g.4xlarge"
              when AEC::InstanceType::R8g8xlarge         then "r8g.8xlarge"
              when AEC::InstanceType::R8g12xlarge        then "r8g.12xlarge"
              when AEC::InstanceType::R8g16xlarge        then "r8g.16xlarge"
              when AEC::InstanceType::R8g24xlarge        then "r8g.24xlarge"
              when AEC::InstanceType::R8g48xlarge        then "r8g.48xlarge"
              when AEC::InstanceType::R8gMetal24xl       then "r8g.metal-24xl"
              when AEC::InstanceType::R8gMetal48xl       then "r8g.metal-48xl"
              when AEC::InstanceType::Mac2M1ultraMetal   then "mac2-m1ultra.metal"
              when AEC::InstanceType::G6eXlarge          then "g6e.xlarge"
              when AEC::InstanceType::G6e2xlarge         then "g6e.2xlarge"
              when AEC::InstanceType::G6e4xlarge         then "g6e.4xlarge"
              when AEC::InstanceType::G6e8xlarge         then "g6e.8xlarge"
              when AEC::InstanceType::G6e12xlarge        then "g6e.12xlarge"
              when AEC::InstanceType::G6e16xlarge        then "g6e.16xlarge"
              when AEC::InstanceType::G6e24xlarge        then "g6e.24xlarge"
              when AEC::InstanceType::G6e48xlarge        then "g6e.48xlarge"
              when AEC::InstanceType::C8gMedium          then "c8g.medium"
              when AEC::InstanceType::C8gLarge           then "c8g.large"
              when AEC::InstanceType::C8gXlarge          then "c8g.xlarge"
              when AEC::InstanceType::C8g2xlarge         then "c8g.2xlarge"
              when AEC::InstanceType::C8g4xlarge         then "c8g.4xlarge"
              when AEC::InstanceType::C8g8xlarge         then "c8g.8xlarge"
              when AEC::InstanceType::C8g12xlarge        then "c8g.12xlarge"
              when AEC::InstanceType::C8g16xlarge        then "c8g.16xlarge"
              when AEC::InstanceType::C8g24xlarge        then "c8g.24xlarge"
              when AEC::InstanceType::C8g48xlarge        then "c8g.48xlarge"
              when AEC::InstanceType::C8gMetal24xl       then "c8g.metal-24xl"
              when AEC::InstanceType::C8gMetal48xl       then "c8g.metal-48xl"
              when AEC::InstanceType::M8gMedium          then "m8g.medium"
              when AEC::InstanceType::M8gLarge           then "m8g.large"
              when AEC::InstanceType::M8gXlarge          then "m8g.xlarge"
              when AEC::InstanceType::M8g2xlarge         then "m8g.2xlarge"
              when AEC::InstanceType::M8g4xlarge         then "m8g.4xlarge"
              when AEC::InstanceType::M8g8xlarge         then "m8g.8xlarge"
              when AEC::InstanceType::M8g12xlarge        then "m8g.12xlarge"
              when AEC::InstanceType::M8g16xlarge        then "m8g.16xlarge"
              when AEC::InstanceType::M8g24xlarge        then "m8g.24xlarge"
              when AEC::InstanceType::M8g48xlarge        then "m8g.48xlarge"
              when AEC::InstanceType::M8gMetal24xl       then "m8g.metal-24xl"
              when AEC::InstanceType::M8gMetal48xl       then "m8g.metal-48xl"
              when AEC::InstanceType::X8gMedium          then "x8g.medium"
              when AEC::InstanceType::X8gLarge           then "x8g.large"
              when AEC::InstanceType::X8gXlarge          then "x8g.xlarge"
              when AEC::InstanceType::X8g2xlarge         then "x8g.2xlarge"
              when AEC::InstanceType::X8g4xlarge         then "x8g.4xlarge"
              when AEC::InstanceType::X8g8xlarge         then "x8g.8xlarge"
              when AEC::InstanceType::X8g12xlarge        then "x8g.12xlarge"
              when AEC::InstanceType::X8g16xlarge        then "x8g.16xlarge"
              when AEC::InstanceType::X8g24xlarge        then "x8g.24xlarge"
              when AEC::InstanceType::X8g48xlarge        then "x8g.48xlarge"
              when AEC::InstanceType::X8gMetal24xl       then "x8g.metal-24xl"
              when AEC::InstanceType::X8gMetal48xl       then "x8g.metal-48xl"
              when AEC::InstanceType::I7ieLarge          then "i7ie.large"
              when AEC::InstanceType::I7ieXlarge         then "i7ie.xlarge"
              when AEC::InstanceType::I7ie2xlarge        then "i7ie.2xlarge"
              when AEC::InstanceType::I7ie3xlarge        then "i7ie.3xlarge"
              when AEC::InstanceType::I7ie6xlarge        then "i7ie.6xlarge"
              when AEC::InstanceType::I7ie12xlarge       then "i7ie.12xlarge"
              when AEC::InstanceType::I7ie18xlarge       then "i7ie.18xlarge"
              when AEC::InstanceType::I7ie24xlarge       then "i7ie.24xlarge"
              when AEC::InstanceType::I7ie48xlarge       then "i7ie.48xlarge"
              when AEC::InstanceType::I8gLarge           then "i8g.large"
              when AEC::InstanceType::I8gXlarge          then "i8g.xlarge"
              when AEC::InstanceType::I8g2xlarge         then "i8g.2xlarge"
              when AEC::InstanceType::I8g4xlarge         then "i8g.4xlarge"
              when AEC::InstanceType::I8g8xlarge         then "i8g.8xlarge"
              when AEC::InstanceType::I8g12xlarge        then "i8g.12xlarge"
              when AEC::InstanceType::I8g16xlarge        then "i8g.16xlarge"
              when AEC::InstanceType::I8g24xlarge        then "i8g.24xlarge"
              when AEC::InstanceType::I8gMetal24xl       then "i8g.metal-24xl"
              when AEC::InstanceType::U7i6tb112xlarge    then "u7i-6tb.112xlarge"
              when AEC::InstanceType::U7i8tb112xlarge    then "u7i-8tb.112xlarge"
              when AEC::InstanceType::U7inh32tb480xlarge then "u7inh-32tb.480xlarge"
              when AEC::InstanceType::P5e48xlarge        then "p5e.48xlarge"
              when AEC::InstanceType::P5en48xlarge       then "p5en.48xlarge"
              when AEC::InstanceType::F212xlarge         then "f2.12xlarge"
              when AEC::InstanceType::F248xlarge         then "f2.48xlarge"
              when AEC::InstanceType::Trn248xlarge       then "trn2.48xlarge"
              when AEC::InstanceType::C7iFlex12xlarge    then "c7i-flex.12xlarge"
              when AEC::InstanceType::C7iFlex16xlarge    then "c7i-flex.16xlarge"
              when AEC::InstanceType::M7iFlex12xlarge    then "m7i-flex.12xlarge"
              when AEC::InstanceType::M7iFlex16xlarge    then "m7i-flex.16xlarge"
              when AEC::InstanceType::I7ieMetal24xl      then "i7ie.metal-24xl"
              when AEC::InstanceType::I7ieMetal48xl      then "i7ie.metal-48xl"
              when AEC::InstanceType::I8g48xlarge        then "i8g.48xlarge"
              when AEC::InstanceType::C8gdMedium         then "c8gd.medium"
              when AEC::InstanceType::C8gdLarge          then "c8gd.large"
              when AEC::InstanceType::C8gdXlarge         then "c8gd.xlarge"
              when AEC::InstanceType::C8gd2xlarge        then "c8gd.2xlarge"
              when AEC::InstanceType::C8gd4xlarge        then "c8gd.4xlarge"
              when AEC::InstanceType::C8gd8xlarge        then "c8gd.8xlarge"
              when AEC::InstanceType::C8gd12xlarge       then "c8gd.12xlarge"
              when AEC::InstanceType::C8gd16xlarge       then "c8gd.16xlarge"
              when AEC::InstanceType::C8gd24xlarge       then "c8gd.24xlarge"
              when AEC::InstanceType::C8gd48xlarge       then "c8gd.48xlarge"
              when AEC::InstanceType::C8gdMetal24xl      then "c8gd.metal-24xl"
              when AEC::InstanceType::C8gdMetal48xl      then "c8gd.metal-48xl"
              when AEC::InstanceType::I7iLarge           then "i7i.large"
              when AEC::InstanceType::I7iXlarge          then "i7i.xlarge"
              when AEC::InstanceType::I7i2xlarge         then "i7i.2xlarge"
              when AEC::InstanceType::I7i4xlarge         then "i7i.4xlarge"
              when AEC::InstanceType::I7i8xlarge         then "i7i.8xlarge"
              when AEC::InstanceType::I7i12xlarge        then "i7i.12xlarge"
              when AEC::InstanceType::I7i16xlarge        then "i7i.16xlarge"
              when AEC::InstanceType::I7i24xlarge        then "i7i.24xlarge"
              when AEC::InstanceType::I7i48xlarge        then "i7i.48xlarge"
              when AEC::InstanceType::I7iMetal24xl       then "i7i.metal-24xl"
              when AEC::InstanceType::I7iMetal48xl       then "i7i.metal-48xl"
              when AEC::InstanceType::P6B20048xlarge     then "p6-b200.48xlarge"
              when AEC::InstanceType::M8gdMedium         then "m8gd.medium"
              when AEC::InstanceType::M8gdLarge          then "m8gd.large"
              when AEC::InstanceType::M8gdXlarge         then "m8gd.xlarge"
              when AEC::InstanceType::M8gd2xlarge        then "m8gd.2xlarge"
              when AEC::InstanceType::M8gd4xlarge        then "m8gd.4xlarge"
              when AEC::InstanceType::M8gd8xlarge        then "m8gd.8xlarge"
              when AEC::InstanceType::M8gd12xlarge       then "m8gd.12xlarge"
              when AEC::InstanceType::M8gd16xlarge       then "m8gd.16xlarge"
              when AEC::InstanceType::M8gd24xlarge       then "m8gd.24xlarge"
              when AEC::InstanceType::M8gd48xlarge       then "m8gd.48xlarge"
              when AEC::InstanceType::M8gdMetal24xl      then "m8gd.metal-24xl"
              when AEC::InstanceType::M8gdMetal48xl      then "m8gd.metal-48xl"
              when AEC::InstanceType::R8gdMedium         then "r8gd.medium"
              when AEC::InstanceType::R8gdLarge          then "r8gd.large"
              when AEC::InstanceType::R8gdXlarge         then "r8gd.xlarge"
              when AEC::InstanceType::R8gd2xlarge        then "r8gd.2xlarge"
              when AEC::InstanceType::R8gd4xlarge        then "r8gd.4xlarge"
              when AEC::InstanceType::R8gd8xlarge        then "r8gd.8xlarge"
              when AEC::InstanceType::R8gd12xlarge       then "r8gd.12xlarge"
              when AEC::InstanceType::R8gd16xlarge       then "r8gd.16xlarge"
              when AEC::InstanceType::R8gd24xlarge       then "r8gd.24xlarge"
              when AEC::InstanceType::R8gd48xlarge       then "r8gd.48xlarge"
              when AEC::InstanceType::R8gdMetal24xl      then "r8gd.metal-24xl"
              when AEC::InstanceType::R8gdMetal48xl      then "r8gd.metal-48xl"
              when AEC::InstanceType::C8gnMedium         then "c8gn.medium"
              when AEC::InstanceType::C8gnLarge          then "c8gn.large"
              when AEC::InstanceType::C8gnXlarge         then "c8gn.xlarge"
              when AEC::InstanceType::C8gn2xlarge        then "c8gn.2xlarge"
              when AEC::InstanceType::C8gn4xlarge        then "c8gn.4xlarge"
              when AEC::InstanceType::C8gn8xlarge        then "c8gn.8xlarge"
              when AEC::InstanceType::C8gn12xlarge       then "c8gn.12xlarge"
              when AEC::InstanceType::C8gn16xlarge       then "c8gn.16xlarge"
              when AEC::InstanceType::C8gn24xlarge       then "c8gn.24xlarge"
              when AEC::InstanceType::C8gn48xlarge       then "c8gn.48xlarge"
              when AEC::InstanceType::C8gnMetal24xl      then "c8gn.metal-24xl"
              when AEC::InstanceType::C8gnMetal48xl      then "c8gn.metal-48xl"
              when AEC::InstanceType::F26xlarge          then "f2.6xlarge"
              when AEC::InstanceType::P6eGb20036xlarge   then "p6e-gb200.36xlarge"
              when AEC::InstanceType::G6fLarge           then "g6f.large"
              when AEC::InstanceType::G6fXlarge          then "g6f.xlarge"
              when AEC::InstanceType::G6f2xlarge         then "g6f.2xlarge"
              when AEC::InstanceType::G6f4xlarge         then "g6f.4xlarge"
              when AEC::InstanceType::Gr6f4xlarge        then "gr6f.4xlarge"
              when AEC::InstanceType::P54xlarge          then "p5.4xlarge"
              when AEC::InstanceType::R8iLarge           then "r8i.large"
              when AEC::InstanceType::R8iXlarge          then "r8i.xlarge"
              when AEC::InstanceType::R8i2xlarge         then "r8i.2xlarge"
              when AEC::InstanceType::R8i4xlarge         then "r8i.4xlarge"
              when AEC::InstanceType::R8i8xlarge         then "r8i.8xlarge"
              when AEC::InstanceType::R8i12xlarge        then "r8i.12xlarge"
              when AEC::InstanceType::R8i16xlarge        then "r8i.16xlarge"
              when AEC::InstanceType::R8i24xlarge        then "r8i.24xlarge"
              when AEC::InstanceType::R8i32xlarge        then "r8i.32xlarge"
              when AEC::InstanceType::R8i48xlarge        then "r8i.48xlarge"
              when AEC::InstanceType::R8i96xlarge        then "r8i.96xlarge"
              when AEC::InstanceType::R8iMetal48xl       then "r8i.metal-48xl"
              when AEC::InstanceType::R8iMetal96xl       then "r8i.metal-96xl"
              when AEC::InstanceType::R8iFlexLarge       then "r8i-flex.large"
              when AEC::InstanceType::R8iFlexXlarge      then "r8i-flex.xlarge"
              when AEC::InstanceType::R8iFlex2xlarge     then "r8i-flex.2xlarge"
              when AEC::InstanceType::R8iFlex4xlarge     then "r8i-flex.4xlarge"
              when AEC::InstanceType::R8iFlex8xlarge     then "r8i-flex.8xlarge"
              when AEC::InstanceType::R8iFlex12xlarge    then "r8i-flex.12xlarge"
              when AEC::InstanceType::R8iFlex16xlarge    then "r8i-flex.16xlarge"
              when AEC::InstanceType::M8iLarge           then "m8i.large"
              when AEC::InstanceType::M8iXlarge          then "m8i.xlarge"
              when AEC::InstanceType::M8i2xlarge         then "m8i.2xlarge"
              when AEC::InstanceType::M8i4xlarge         then "m8i.4xlarge"
              when AEC::InstanceType::M8i8xlarge         then "m8i.8xlarge"
              when AEC::InstanceType::M8i12xlarge        then "m8i.12xlarge"
              when AEC::InstanceType::M8i16xlarge        then "m8i.16xlarge"
              when AEC::InstanceType::M8i24xlarge        then "m8i.24xlarge"
              when AEC::InstanceType::M8i32xlarge        then "m8i.32xlarge"
              when AEC::InstanceType::M8i48xlarge        then "m8i.48xlarge"
              when AEC::InstanceType::M8i96xlarge        then "m8i.96xlarge"
              when AEC::InstanceType::M8iMetal48xl       then "m8i.metal-48xl"
              when AEC::InstanceType::M8iMetal96xl       then "m8i.metal-96xl"
              when AEC::InstanceType::M8iFlexLarge       then "m8i-flex.large"
              when AEC::InstanceType::M8iFlexXlarge      then "m8i-flex.xlarge"
              when AEC::InstanceType::M8iFlex2xlarge     then "m8i-flex.2xlarge"
              when AEC::InstanceType::M8iFlex4xlarge     then "m8i-flex.4xlarge"
              when AEC::InstanceType::M8iFlex8xlarge     then "m8i-flex.8xlarge"
              when AEC::InstanceType::M8iFlex12xlarge    then "m8i-flex.12xlarge"
              when AEC::InstanceType::M8iFlex16xlarge    then "m8i-flex.16xlarge"
              when AEC::InstanceType::I8geLarge          then "i8ge.large"
              when AEC::InstanceType::I8geXlarge         then "i8ge.xlarge"
              when AEC::InstanceType::I8ge2xlarge        then "i8ge.2xlarge"
              when AEC::InstanceType::I8ge3xlarge        then "i8ge.3xlarge"
              when AEC::InstanceType::I8ge6xlarge        then "i8ge.6xlarge"
              when AEC::InstanceType::I8ge12xlarge       then "i8ge.12xlarge"
              when AEC::InstanceType::I8ge18xlarge       then "i8ge.18xlarge"
              when AEC::InstanceType::I8ge24xlarge       then "i8ge.24xlarge"
              when AEC::InstanceType::I8ge48xlarge       then "i8ge.48xlarge"
              when AEC::InstanceType::I8geMetal24xl      then "i8ge.metal-24xl"
              when AEC::InstanceType::I8geMetal48xl      then "i8ge.metal-48xl"
              when AEC::InstanceType::MacM4Metal         then "mac-m4.metal"
              when AEC::InstanceType::MacM4proMetal      then "mac-m4pro.metal"
              when AEC::InstanceType::R8gnMedium         then "r8gn.medium"
              when AEC::InstanceType::R8gnLarge          then "r8gn.large"
              when AEC::InstanceType::R8gnXlarge         then "r8gn.xlarge"
              when AEC::InstanceType::R8gn2xlarge        then "r8gn.2xlarge"
              when AEC::InstanceType::R8gn4xlarge        then "r8gn.4xlarge"
              when AEC::InstanceType::R8gn8xlarge        then "r8gn.8xlarge"
              when AEC::InstanceType::R8gn12xlarge       then "r8gn.12xlarge"
              when AEC::InstanceType::R8gn16xlarge       then "r8gn.16xlarge"
              when AEC::InstanceType::R8gn24xlarge       then "r8gn.24xlarge"
              when AEC::InstanceType::R8gn48xlarge       then "r8gn.48xlarge"
              when AEC::InstanceType::R8gnMetal24xl      then "r8gn.metal-24xl"
              when AEC::InstanceType::R8gnMetal48xl      then "r8gn.metal-48xl"
              when AEC::InstanceType::C8iLarge           then "c8i.large"
              when AEC::InstanceType::C8iXlarge          then "c8i.xlarge"
              when AEC::InstanceType::C8i2xlarge         then "c8i.2xlarge"
              when AEC::InstanceType::C8i4xlarge         then "c8i.4xlarge"
              when AEC::InstanceType::C8i8xlarge         then "c8i.8xlarge"
              when AEC::InstanceType::C8i12xlarge        then "c8i.12xlarge"
              when AEC::InstanceType::C8i16xlarge        then "c8i.16xlarge"
              when AEC::InstanceType::C8i24xlarge        then "c8i.24xlarge"
              when AEC::InstanceType::C8i32xlarge        then "c8i.32xlarge"
              when AEC::InstanceType::C8i48xlarge        then "c8i.48xlarge"
              when AEC::InstanceType::C8i96xlarge        then "c8i.96xlarge"
              when AEC::InstanceType::C8iMetal48xl       then "c8i.metal-48xl"
              when AEC::InstanceType::C8iMetal96xl       then "c8i.metal-96xl"
              when AEC::InstanceType::C8iFlexLarge       then "c8i-flex.large"
              when AEC::InstanceType::C8iFlexXlarge      then "c8i-flex.xlarge"
              when AEC::InstanceType::C8iFlex2xlarge     then "c8i-flex.2xlarge"
              when AEC::InstanceType::C8iFlex4xlarge     then "c8i-flex.4xlarge"
              when AEC::InstanceType::C8iFlex8xlarge     then "c8i-flex.8xlarge"
              when AEC::InstanceType::C8iFlex12xlarge    then "c8i-flex.12xlarge"
              when AEC::InstanceType::C8iFlex16xlarge    then "c8i-flex.16xlarge"
              when AEC::InstanceType::R8gbMedium         then "r8gb.medium"
              when AEC::InstanceType::R8gbLarge          then "r8gb.large"
              when AEC::InstanceType::R8gbXlarge         then "r8gb.xlarge"
              when AEC::InstanceType::R8gb2xlarge        then "r8gb.2xlarge"
              when AEC::InstanceType::R8gb4xlarge        then "r8gb.4xlarge"
              when AEC::InstanceType::R8gb8xlarge        then "r8gb.8xlarge"
              when AEC::InstanceType::R8gb12xlarge       then "r8gb.12xlarge"
              when AEC::InstanceType::R8gb16xlarge       then "r8gb.16xlarge"
              when AEC::InstanceType::R8gb24xlarge       then "r8gb.24xlarge"
              when AEC::InstanceType::R8gbMetal24xl      then "r8gb.metal-24xl"
              when AEC::InstanceType::M8aMedium          then "m8a.medium"
              when AEC::InstanceType::M8aLarge           then "m8a.large"
              when AEC::InstanceType::M8aXlarge          then "m8a.xlarge"
              when AEC::InstanceType::M8a2xlarge         then "m8a.2xlarge"
              when AEC::InstanceType::M8a4xlarge         then "m8a.4xlarge"
              when AEC::InstanceType::M8a8xlarge         then "m8a.8xlarge"
              when AEC::InstanceType::M8a12xlarge        then "m8a.12xlarge"
              when AEC::InstanceType::M8a16xlarge        then "m8a.16xlarge"
              when AEC::InstanceType::M8a24xlarge        then "m8a.24xlarge"
              when AEC::InstanceType::M8a48xlarge        then "m8a.48xlarge"
              when AEC::InstanceType::M8aMetal24xl       then "m8a.metal-24xl"
              when AEC::InstanceType::M8aMetal48xl       then "m8a.metal-48xl"
              when AEC::InstanceType::Trn23xlarge        then "trn2.3xlarge"
              when AEC::InstanceType::R8aMedium          then "r8a.medium"
              when AEC::InstanceType::R8aLarge           then "r8a.large"
              when AEC::InstanceType::R8aXlarge          then "r8a.xlarge"
              when AEC::InstanceType::R8a2xlarge         then "r8a.2xlarge"
              when AEC::InstanceType::R8a4xlarge         then "r8a.4xlarge"
              when AEC::InstanceType::R8a8xlarge         then "r8a.8xlarge"
              when AEC::InstanceType::R8a12xlarge        then "r8a.12xlarge"
              when AEC::InstanceType::R8a16xlarge        then "r8a.16xlarge"
              when AEC::InstanceType::R8a24xlarge        then "r8a.24xlarge"
              when AEC::InstanceType::R8a48xlarge        then "r8a.48xlarge"
              when AEC::InstanceType::R8aMetal24xl       then "r8a.metal-24xl"
              when AEC::InstanceType::R8aMetal48xl       then "r8a.metal-48xl"
              when AEC::InstanceType::P6B30048xlarge     then "p6-b300.48xlarge"
              when AEC::InstanceType::C8aMedium          then "c8a.medium"
              when AEC::InstanceType::C8aLarge           then "c8a.large"
              when AEC::InstanceType::C8aXlarge          then "c8a.xlarge"
              when AEC::InstanceType::C8a2xlarge         then "c8a.2xlarge"
              when AEC::InstanceType::C8a4xlarge         then "c8a.4xlarge"
              when AEC::InstanceType::C8a8xlarge         then "c8a.8xlarge"
              when AEC::InstanceType::C8a12xlarge        then "c8a.12xlarge"
              when AEC::InstanceType::C8a16xlarge        then "c8a.16xlarge"
              when AEC::InstanceType::C8a24xlarge        then "c8a.24xlarge"
              when AEC::InstanceType::C8a48xlarge        then "c8a.48xlarge"
              when AEC::InstanceType::C8aMetal24xl       then "c8a.metal-24xl"
              when AEC::InstanceType::C8aMetal48xl       then "c8a.metal-48xl"
              when AEC::InstanceType::C8gb12xlarge       then "c8gb.12xlarge"
              when AEC::InstanceType::C8gb16xlarge       then "c8gb.16xlarge"
              when AEC::InstanceType::C8gb24xlarge       then "c8gb.24xlarge"
              when AEC::InstanceType::C8gb2xlarge        then "c8gb.2xlarge"
              when AEC::InstanceType::C8gb4xlarge        then "c8gb.4xlarge"
              when AEC::InstanceType::C8gb8xlarge        then "c8gb.8xlarge"
              when AEC::InstanceType::C8gbLarge          then "c8gb.large"
              when AEC::InstanceType::C8gbMedium         then "c8gb.medium"
              when AEC::InstanceType::C8gbMetal24xl      then "c8gb.metal-24xl"
              when AEC::InstanceType::C8gbXlarge         then "c8gb.xlarge"
              when AEC::InstanceType::C8gb48xlarge       then "c8gb.48xlarge"
              when AEC::InstanceType::C8gbMetal48xl      then "c8gb.metal-48xl"
              when AEC::InstanceType::M8gb12xlarge       then "m8gb.12xlarge"
              when AEC::InstanceType::M8gb16xlarge       then "m8gb.16xlarge"
              when AEC::InstanceType::M8gb24xlarge       then "m8gb.24xlarge"
              when AEC::InstanceType::M8gb2xlarge        then "m8gb.2xlarge"
              when AEC::InstanceType::M8gb4xlarge        then "m8gb.4xlarge"
              when AEC::InstanceType::M8gb8xlarge        then "m8gb.8xlarge"
              when AEC::InstanceType::M8gbLarge          then "m8gb.large"
              when AEC::InstanceType::M8gbMedium         then "m8gb.medium"
              when AEC::InstanceType::M8gbXlarge         then "m8gb.xlarge"
              when AEC::InstanceType::M8gb48xlarge       then "m8gb.48xlarge"
              when AEC::InstanceType::M8gbMetal24xl      then "m8gb.metal-24xl"
              when AEC::InstanceType::M8gbMetal48xl      then "m8gb.metal-48xl"
              when AEC::InstanceType::M8gn12xlarge       then "m8gn.12xlarge"
              when AEC::InstanceType::M8gn16xlarge       then "m8gn.16xlarge"
              when AEC::InstanceType::M8gn24xlarge       then "m8gn.24xlarge"
              when AEC::InstanceType::M8gn2xlarge        then "m8gn.2xlarge"
              when AEC::InstanceType::M8gn48xlarge       then "m8gn.48xlarge"
              when AEC::InstanceType::M8gn4xlarge        then "m8gn.4xlarge"
              when AEC::InstanceType::M8gn8xlarge        then "m8gn.8xlarge"
              when AEC::InstanceType::M8gnLarge          then "m8gn.large"
              when AEC::InstanceType::M8gnMedium         then "m8gn.medium"
              when AEC::InstanceType::M8gnXlarge         then "m8gn.xlarge"
              when AEC::InstanceType::M8gnMetal24xl      then "m8gn.metal-24xl"
              when AEC::InstanceType::M8gnMetal48xl      then "m8gn.metal-48xl"
              when AEC::InstanceType::X8aedz12xlarge     then "x8aedz.12xlarge"
              when AEC::InstanceType::X8aedz24xlarge     then "x8aedz.24xlarge"
              when AEC::InstanceType::X8aedz3xlarge      then "x8aedz.3xlarge"
              when AEC::InstanceType::X8aedz6xlarge      then "x8aedz.6xlarge"
              when AEC::InstanceType::X8aedzLarge        then "x8aedz.large"
              when AEC::InstanceType::X8aedzMetal12xl    then "x8aedz.metal-12xl"
              when AEC::InstanceType::X8aedzMetal24xl    then "x8aedz.metal-24xl"
              when AEC::InstanceType::X8aedzXlarge       then "x8aedz.xlarge"
              when AEC::InstanceType::M8aznMedium        then "m8azn.medium"
              when AEC::InstanceType::M8aznLarge         then "m8azn.large"
              when AEC::InstanceType::M8aznXlarge        then "m8azn.xlarge"
              when AEC::InstanceType::M8azn3xlarge       then "m8azn.3xlarge"
              when AEC::InstanceType::M8azn6xlarge       then "m8azn.6xlarge"
              when AEC::InstanceType::M8azn12xlarge      then "m8azn.12xlarge"
              when AEC::InstanceType::M8azn24xlarge      then "m8azn.24xlarge"
              when AEC::InstanceType::M8aznMetal12xl     then "m8azn.metal-12xl"
              when AEC::InstanceType::M8aznMetal24xl     then "m8azn.metal-24xl"
              when AEC::InstanceType::X8iLarge           then "x8i.large"
              when AEC::InstanceType::X8iXlarge          then "x8i.xlarge"
              when AEC::InstanceType::X8i2xlarge         then "x8i.2xlarge"
              when AEC::InstanceType::X8i4xlarge         then "x8i.4xlarge"
              when AEC::InstanceType::X8i8xlarge         then "x8i.8xlarge"
              when AEC::InstanceType::X8i12xlarge        then "x8i.12xlarge"
              when AEC::InstanceType::X8i16xlarge        then "x8i.16xlarge"
              when AEC::InstanceType::X8i24xlarge        then "x8i.24xlarge"
              when AEC::InstanceType::X8i32xlarge        then "x8i.32xlarge"
              when AEC::InstanceType::X8i48xlarge        then "x8i.48xlarge"
              when AEC::InstanceType::X8i64xlarge        then "x8i.64xlarge"
              when AEC::InstanceType::X8i96xlarge        then "x8i.96xlarge"
              when AEC::InstanceType::X8iMetal48xl       then "x8i.metal-48xl"
              when AEC::InstanceType::X8iMetal96xl       then "x8i.metal-96xl"
              when AEC::InstanceType::MacM4maxMetal      then "mac-m4max.metal"
              when AEC::InstanceType::G7e2xlarge         then "g7e.2xlarge"
              when AEC::InstanceType::G7e4xlarge         then "g7e.4xlarge"
              when AEC::InstanceType::G7e8xlarge         then "g7e.8xlarge"
              when AEC::InstanceType::G7e12xlarge        then "g7e.12xlarge"
              when AEC::InstanceType::G7e24xlarge        then "g7e.24xlarge"
              when AEC::InstanceType::G7e48xlarge        then "g7e.48xlarge"
              when AEC::InstanceType::R8idLarge          then "r8id.large"
              when AEC::InstanceType::R8idXlarge         then "r8id.xlarge"
              when AEC::InstanceType::R8id2xlarge        then "r8id.2xlarge"
              when AEC::InstanceType::R8id4xlarge        then "r8id.4xlarge"
              when AEC::InstanceType::R8id8xlarge        then "r8id.8xlarge"
              when AEC::InstanceType::R8id12xlarge       then "r8id.12xlarge"
              when AEC::InstanceType::R8id16xlarge       then "r8id.16xlarge"
              when AEC::InstanceType::R8id24xlarge       then "r8id.24xlarge"
              when AEC::InstanceType::R8id32xlarge       then "r8id.32xlarge"
              when AEC::InstanceType::R8id48xlarge       then "r8id.48xlarge"
              when AEC::InstanceType::R8id96xlarge       then "r8id.96xlarge"
              when AEC::InstanceType::R8idMetal48xl      then "r8id.metal-48xl"
              when AEC::InstanceType::R8idMetal96xl      then "r8id.metal-96xl"
              when AEC::InstanceType::C8idLarge          then "c8id.large"
              when AEC::InstanceType::C8idXlarge         then "c8id.xlarge"
              when AEC::InstanceType::C8id2xlarge        then "c8id.2xlarge"
              when AEC::InstanceType::C8id4xlarge        then "c8id.4xlarge"
              when AEC::InstanceType::C8id8xlarge        then "c8id.8xlarge"
              when AEC::InstanceType::C8id12xlarge       then "c8id.12xlarge"
              when AEC::InstanceType::C8id16xlarge       then "c8id.16xlarge"
              when AEC::InstanceType::C8id24xlarge       then "c8id.24xlarge"
              when AEC::InstanceType::C8id32xlarge       then "c8id.32xlarge"
              when AEC::InstanceType::C8id48xlarge       then "c8id.48xlarge"
              when AEC::InstanceType::C8id96xlarge       then "c8id.96xlarge"
              when AEC::InstanceType::C8idMetal48xl      then "c8id.metal-48xl"
              when AEC::InstanceType::C8idMetal96xl      then "c8id.metal-96xl"
              when AEC::InstanceType::M8idLarge          then "m8id.large"
              when AEC::InstanceType::M8idXlarge         then "m8id.xlarge"
              when AEC::InstanceType::M8id2xlarge        then "m8id.2xlarge"
              when AEC::InstanceType::M8id4xlarge        then "m8id.4xlarge"
              when AEC::InstanceType::M8id8xlarge        then "m8id.8xlarge"
              when AEC::InstanceType::M8id12xlarge       then "m8id.12xlarge"
              when AEC::InstanceType::M8id16xlarge       then "m8id.16xlarge"
              when AEC::InstanceType::M8id24xlarge       then "m8id.24xlarge"
              when AEC::InstanceType::M8id32xlarge       then "m8id.32xlarge"
              when AEC::InstanceType::M8id48xlarge       then "m8id.48xlarge"
              when AEC::InstanceType::M8id96xlarge       then "m8id.96xlarge"
              when AEC::InstanceType::M8idMetal48xl      then "m8id.metal-48xl"
              when AEC::InstanceType::M8idMetal96xl      then "m8id.metal-96xl"
              when AEC::InstanceType::Hpc8a96xlarge      then "hpc8a.96xlarge"
              when AEC::InstanceType::C8inLarge          then "c8in.large"
              when AEC::InstanceType::C8inXlarge         then "c8in.xlarge"
              when AEC::InstanceType::C8in2xlarge        then "c8in.2xlarge"
              when AEC::InstanceType::C8in4xlarge        then "c8in.4xlarge"
              when AEC::InstanceType::C8in8xlarge        then "c8in.8xlarge"
              when AEC::InstanceType::C8in12xlarge       then "c8in.12xlarge"
              when AEC::InstanceType::C8in16xlarge       then "c8in.16xlarge"
              when AEC::InstanceType::C8in24xlarge       then "c8in.24xlarge"
              when AEC::InstanceType::C8in32xlarge       then "c8in.32xlarge"
              when AEC::InstanceType::C8in48xlarge       then "c8in.48xlarge"
              when AEC::InstanceType::C8in96xlarge       then "c8in.96xlarge"
              when AEC::InstanceType::C8inMetal48xl      then "c8in.metal-48xl"
              when AEC::InstanceType::C8inMetal96xl      then "c8in.metal-96xl"
              when AEC::InstanceType::C8ibLarge          then "c8ib.large"
              when AEC::InstanceType::C8ibXlarge         then "c8ib.xlarge"
              when AEC::InstanceType::C8ib2xlarge        then "c8ib.2xlarge"
              when AEC::InstanceType::C8ib4xlarge        then "c8ib.4xlarge"
              when AEC::InstanceType::C8ib8xlarge        then "c8ib.8xlarge"
              when AEC::InstanceType::C8ib12xlarge       then "c8ib.12xlarge"
              when AEC::InstanceType::C8ib16xlarge       then "c8ib.16xlarge"
              when AEC::InstanceType::C8ib24xlarge       then "c8ib.24xlarge"
              when AEC::InstanceType::C8ib32xlarge       then "c8ib.32xlarge"
              when AEC::InstanceType::C8ib48xlarge       then "c8ib.48xlarge"
              when AEC::InstanceType::C8ib96xlarge       then "c8ib.96xlarge"
              when AEC::InstanceType::C8ibMetal48xl      then "c8ib.metal-48xl"
              when AEC::InstanceType::C8ibMetal96xl      then "c8ib.metal-96xl"
              when AEC::InstanceType::R8inLarge          then "r8in.large"
              when AEC::InstanceType::R8inXlarge         then "r8in.xlarge"
              when AEC::InstanceType::R8in2xlarge        then "r8in.2xlarge"
              when AEC::InstanceType::R8in4xlarge        then "r8in.4xlarge"
              when AEC::InstanceType::R8in8xlarge        then "r8in.8xlarge"
              when AEC::InstanceType::R8in12xlarge       then "r8in.12xlarge"
              when AEC::InstanceType::R8in16xlarge       then "r8in.16xlarge"
              when AEC::InstanceType::R8in24xlarge       then "r8in.24xlarge"
              when AEC::InstanceType::R8in32xlarge       then "r8in.32xlarge"
              when AEC::InstanceType::R8in48xlarge       then "r8in.48xlarge"
              when AEC::InstanceType::R8in96xlarge       then "r8in.96xlarge"
              when AEC::InstanceType::R8ibLarge          then "r8ib.large"
              when AEC::InstanceType::R8ibXlarge         then "r8ib.xlarge"
              when AEC::InstanceType::R8ib2xlarge        then "r8ib.2xlarge"
              when AEC::InstanceType::R8ib4xlarge        then "r8ib.4xlarge"
              when AEC::InstanceType::R8ib8xlarge        then "r8ib.8xlarge"
              when AEC::InstanceType::R8ib12xlarge       then "r8ib.12xlarge"
              when AEC::InstanceType::R8ib16xlarge       then "r8ib.16xlarge"
              when AEC::InstanceType::R8ib24xlarge       then "r8ib.24xlarge"
              when AEC::InstanceType::R8ib32xlarge       then "r8ib.32xlarge"
              when AEC::InstanceType::R8ib48xlarge       then "r8ib.48xlarge"
              when AEC::InstanceType::R8ib96xlarge       then "r8ib.96xlarge"
              when AEC::InstanceType::M8inLarge          then "m8in.large"
              when AEC::InstanceType::M8inXlarge         then "m8in.xlarge"
              when AEC::InstanceType::M8in2xlarge        then "m8in.2xlarge"
              when AEC::InstanceType::M8in4xlarge        then "m8in.4xlarge"
              when AEC::InstanceType::M8in8xlarge        then "m8in.8xlarge"
              when AEC::InstanceType::M8in12xlarge       then "m8in.12xlarge"
              when AEC::InstanceType::M8in16xlarge       then "m8in.16xlarge"
              when AEC::InstanceType::M8in24xlarge       then "m8in.24xlarge"
              when AEC::InstanceType::M8in32xlarge       then "m8in.32xlarge"
              when AEC::InstanceType::M8in48xlarge       then "m8in.48xlarge"
              when AEC::InstanceType::M8in96xlarge       then "m8in.96xlarge"
              when AEC::InstanceType::M8ibLarge          then "m8ib.large"
              when AEC::InstanceType::M8ibXlarge         then "m8ib.xlarge"
              when AEC::InstanceType::M8ib2xlarge        then "m8ib.2xlarge"
              when AEC::InstanceType::M8ib4xlarge        then "m8ib.4xlarge"
              when AEC::InstanceType::M8ib8xlarge        then "m8ib.8xlarge"
              when AEC::InstanceType::M8ib12xlarge       then "m8ib.12xlarge"
              when AEC::InstanceType::M8ib16xlarge       then "m8ib.16xlarge"
              when AEC::InstanceType::M8ib24xlarge       then "m8ib.24xlarge"
              when AEC::InstanceType::M8ib32xlarge       then "m8ib.32xlarge"
              when AEC::InstanceType::M8ib48xlarge       then "m8ib.48xlarge"
              when AEC::InstanceType::M8ib96xlarge       then "m8ib.96xlarge"
              when AEC::InstanceType::M8ineLarge         then "m8ine.large"
              when AEC::InstanceType::M8ineXlarge        then "m8ine.xlarge"
              when AEC::InstanceType::M8ine2xlarge       then "m8ine.2xlarge"
              when AEC::InstanceType::M8ine4xlarge       then "m8ine.4xlarge"
              when AEC::InstanceType::M8ine8xlarge       then "m8ine.8xlarge"
              when AEC::InstanceType::M8ine12xlarge      then "m8ine.12xlarge"
              when AEC::InstanceType::C8ineLarge         then "c8ine.large"
              when AEC::InstanceType::C8ineXlarge        then "c8ine.xlarge"
              when AEC::InstanceType::C8ine2xlarge       then "c8ine.2xlarge"
              when AEC::InstanceType::C8ine4xlarge       then "c8ine.4xlarge"
              when AEC::InstanceType::C8ine8xlarge       then "c8ine.8xlarge"
              when AEC::InstanceType::C8ine12xlarge      then "c8ine.12xlarge"
              when AEC::InstanceType::M8idnLarge         then "m8idn.large"
              when AEC::InstanceType::M8idnXlarge        then "m8idn.xlarge"
              when AEC::InstanceType::M8idn2xlarge       then "m8idn.2xlarge"
              when AEC::InstanceType::M8idn4xlarge       then "m8idn.4xlarge"
              when AEC::InstanceType::M8idn8xlarge       then "m8idn.8xlarge"
              when AEC::InstanceType::M8idn12xlarge      then "m8idn.12xlarge"
              when AEC::InstanceType::M8idn16xlarge      then "m8idn.16xlarge"
              when AEC::InstanceType::M8idn24xlarge      then "m8idn.24xlarge"
              when AEC::InstanceType::M8idn32xlarge      then "m8idn.32xlarge"
              when AEC::InstanceType::M8idn48xlarge      then "m8idn.48xlarge"
              when AEC::InstanceType::M8idn96xlarge      then "m8idn.96xlarge"
              when AEC::InstanceType::R8idnLarge         then "r8idn.large"
              when AEC::InstanceType::R8idnXlarge        then "r8idn.xlarge"
              when AEC::InstanceType::R8idn2xlarge       then "r8idn.2xlarge"
              when AEC::InstanceType::R8idn4xlarge       then "r8idn.4xlarge"
              when AEC::InstanceType::R8idn8xlarge       then "r8idn.8xlarge"
              when AEC::InstanceType::R8idn12xlarge      then "r8idn.12xlarge"
              when AEC::InstanceType::R8idn16xlarge      then "r8idn.16xlarge"
              when AEC::InstanceType::R8idn24xlarge      then "r8idn.24xlarge"
              when AEC::InstanceType::R8idn32xlarge      then "r8idn.32xlarge"
              when AEC::InstanceType::R8idn48xlarge      then "r8idn.48xlarge"
              when AEC::InstanceType::R8idn96xlarge      then "r8idn.96xlarge"
              when AEC::InstanceType::M8idbLarge         then "m8idb.large"
              when AEC::InstanceType::M8idbXlarge        then "m8idb.xlarge"
              when AEC::InstanceType::M8idb2xlarge       then "m8idb.2xlarge"
              when AEC::InstanceType::M8idb4xlarge       then "m8idb.4xlarge"
              when AEC::InstanceType::M8idb8xlarge       then "m8idb.8xlarge"
              when AEC::InstanceType::M8idb12xlarge      then "m8idb.12xlarge"
              when AEC::InstanceType::M8idb16xlarge      then "m8idb.16xlarge"
              when AEC::InstanceType::M8idb24xlarge      then "m8idb.24xlarge"
              when AEC::InstanceType::M8idb32xlarge      then "m8idb.32xlarge"
              when AEC::InstanceType::M8idb48xlarge      then "m8idb.48xlarge"
              when AEC::InstanceType::M8idb96xlarge      then "m8idb.96xlarge"
              when AEC::InstanceType::R8idbLarge         then "r8idb.large"
              when AEC::InstanceType::R8idbXlarge        then "r8idb.xlarge"
              when AEC::InstanceType::R8idb2xlarge       then "r8idb.2xlarge"
              when AEC::InstanceType::R8idb4xlarge       then "r8idb.4xlarge"
              when AEC::InstanceType::R8idb8xlarge       then "r8idb.8xlarge"
              when AEC::InstanceType::R8idb12xlarge      then "r8idb.12xlarge"
              when AEC::InstanceType::R8idb16xlarge      then "r8idb.16xlarge"
              when AEC::InstanceType::R8idb24xlarge      then "r8idb.24xlarge"
              when AEC::InstanceType::R8idb32xlarge      then "r8idb.32xlarge"
              when AEC::InstanceType::R8idb48xlarge      then "r8idb.48xlarge"
              when AEC::InstanceType::R8idb96xlarge      then "r8idb.96xlarge"
              when AEC::InstanceType::MacM3ultraMetal    then "mac-m3ultra.metal"
              when AEC::InstanceType::M9gLarge           then "m9g.large"
              when AEC::InstanceType::M9gXlarge          then "m9g.xlarge"
              when AEC::InstanceType::M9g2xlarge         then "m9g.2xlarge"
              when AEC::InstanceType::M9g4xlarge         then "m9g.4xlarge"
              when AEC::InstanceType::M9g8xlarge         then "m9g.8xlarge"
              when AEC::InstanceType::M9g12xlarge        then "m9g.12xlarge"
              when AEC::InstanceType::M9g16xlarge        then "m9g.16xlarge"
              when AEC::InstanceType::M9g24xlarge        then "m9g.24xlarge"
              when AEC::InstanceType::M9g48xlarge        then "m9g.48xlarge"
              when AEC::InstanceType::M9gMetal24xl       then "m9g.metal-24xl"
              when AEC::InstanceType::M9gMetal48xl       then "m9g.metal-48xl"
              when AEC::InstanceType::M9gdLarge          then "m9gd.large"
              when AEC::InstanceType::M9gdXlarge         then "m9gd.xlarge"
              when AEC::InstanceType::M9gd2xlarge        then "m9gd.2xlarge"
              when AEC::InstanceType::M9gd4xlarge        then "m9gd.4xlarge"
              when AEC::InstanceType::M9gd8xlarge        then "m9gd.8xlarge"
              when AEC::InstanceType::M9gd12xlarge       then "m9gd.12xlarge"
              when AEC::InstanceType::M9gd16xlarge       then "m9gd.16xlarge"
              when AEC::InstanceType::M9gd24xlarge       then "m9gd.24xlarge"
              when AEC::InstanceType::M9gd48xlarge       then "m9gd.48xlarge"
              when AEC::InstanceType::M9gdMetal24xl      then "m9gd.metal-24xl"
              when AEC::InstanceType::M9gdMetal48xl      then "m9gd.metal-48xl"
              when AEC::InstanceType::R8inMetal48xl      then "r8in.metal-48xl"
              when AEC::InstanceType::R8inMetal96xl      then "r8in.metal-96xl"
              when AEC::InstanceType::R8ibMetal48xl      then "r8ib.metal-48xl"
              when AEC::InstanceType::R8ibMetal96xl      then "r8ib.metal-96xl"
              when AEC::InstanceType::R8idnMetal48xl     then "r8idn.metal-48xl"
              when AEC::InstanceType::R8idnMetal96xl     then "r8idn.metal-96xl"
              when AEC::InstanceType::R8idbMetal48xl     then "r8idb.metal-48xl"
              when AEC::InstanceType::R8idbMetal96xl     then "r8idb.metal-96xl"
              when AEC::InstanceType::M8inMetal48xl      then "m8in.metal-48xl"
              when AEC::InstanceType::M8inMetal96xl      then "m8in.metal-96xl"
              when AEC::InstanceType::M8ibMetal48xl      then "m8ib.metal-48xl"
              when AEC::InstanceType::M8ibMetal96xl      then "m8ib.metal-96xl"
              when AEC::InstanceType::M8idnMetal48xl     then "m8idn.metal-48xl"
              when AEC::InstanceType::M8idnMetal96xl     then "m8idn.metal-96xl"
              when AEC::InstanceType::M8idbMetal48xl     then "m8idb.metal-48xl"
              when AEC::InstanceType::M8idbMetal96xl     then "m8idb.metal-96xl"
              when AEC::InstanceType::G72xlarge          then "g7.2xlarge"
              when AEC::InstanceType::G74xlarge          then "g7.4xlarge"
              when AEC::InstanceType::G78xlarge          then "g7.8xlarge"
              when AEC::InstanceType::G712xlarge         then "g7.12xlarge"
              when AEC::InstanceType::G724xlarge         then "g7.24xlarge"
              when AEC::InstanceType::G748xlarge         then "g7.48xlarge"
              when AEC::InstanceType::C9gMedium          then "c9g.medium"
              when AEC::InstanceType::C9gLarge           then "c9g.large"
              when AEC::InstanceType::C9gXlarge          then "c9g.xlarge"
              when AEC::InstanceType::C9g2xlarge         then "c9g.2xlarge"
              when AEC::InstanceType::C9g4xlarge         then "c9g.4xlarge"
              when AEC::InstanceType::C9g8xlarge         then "c9g.8xlarge"
              when AEC::InstanceType::C9g12xlarge        then "c9g.12xlarge"
              when AEC::InstanceType::C9g16xlarge        then "c9g.16xlarge"
              when AEC::InstanceType::C9g24xlarge        then "c9g.24xlarge"
              when AEC::InstanceType::C9g48xlarge        then "c9g.48xlarge"
              when AEC::InstanceType::C9gMetal48xl       then "c9g.metal-48xl"
              when AEC::InstanceType::C9gdMedium         then "c9gd.medium"
              when AEC::InstanceType::C9gdLarge          then "c9gd.large"
              when AEC::InstanceType::C9gdXlarge         then "c9gd.xlarge"
              when AEC::InstanceType::C9gd2xlarge        then "c9gd.2xlarge"
              when AEC::InstanceType::C9gd4xlarge        then "c9gd.4xlarge"
              when AEC::InstanceType::C9gd8xlarge        then "c9gd.8xlarge"
              when AEC::InstanceType::C9gd12xlarge       then "c9gd.12xlarge"
              when AEC::InstanceType::C9gd16xlarge       then "c9gd.16xlarge"
              when AEC::InstanceType::C9gd24xlarge       then "c9gd.24xlarge"
              when AEC::InstanceType::C9gd48xlarge       then "c9gd.48xlarge"
              when AEC::InstanceType::C9gdMetal48xl      then "c9gd.metal-48xl"
              else
                raise Exception.new("unknown enum value for 'InstanceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceType
      value = pull.read_string
      case value
      when "a1.medium"            then AEC::InstanceType::A1Medium
      when "a1.large"             then AEC::InstanceType::A1Large
      when "a1.xlarge"            then AEC::InstanceType::A1Xlarge
      when "a1.2xlarge"           then AEC::InstanceType::A12xlarge
      when "a1.4xlarge"           then AEC::InstanceType::A14xlarge
      when "a1.metal"             then AEC::InstanceType::A1Metal
      when "c1.medium"            then AEC::InstanceType::C1Medium
      when "c1.xlarge"            then AEC::InstanceType::C1Xlarge
      when "c3.large"             then AEC::InstanceType::C3Large
      when "c3.xlarge"            then AEC::InstanceType::C3Xlarge
      when "c3.2xlarge"           then AEC::InstanceType::C32xlarge
      when "c3.4xlarge"           then AEC::InstanceType::C34xlarge
      when "c3.8xlarge"           then AEC::InstanceType::C38xlarge
      when "c4.large"             then AEC::InstanceType::C4Large
      when "c4.xlarge"            then AEC::InstanceType::C4Xlarge
      when "c4.2xlarge"           then AEC::InstanceType::C42xlarge
      when "c4.4xlarge"           then AEC::InstanceType::C44xlarge
      when "c4.8xlarge"           then AEC::InstanceType::C48xlarge
      when "c5.large"             then AEC::InstanceType::C5Large
      when "c5.xlarge"            then AEC::InstanceType::C5Xlarge
      when "c5.2xlarge"           then AEC::InstanceType::C52xlarge
      when "c5.4xlarge"           then AEC::InstanceType::C54xlarge
      when "c5.9xlarge"           then AEC::InstanceType::C59xlarge
      when "c5.12xlarge"          then AEC::InstanceType::C512xlarge
      when "c5.18xlarge"          then AEC::InstanceType::C518xlarge
      when "c5.24xlarge"          then AEC::InstanceType::C524xlarge
      when "c5.metal"             then AEC::InstanceType::C5Metal
      when "c5a.large"            then AEC::InstanceType::C5aLarge
      when "c5a.xlarge"           then AEC::InstanceType::C5aXlarge
      when "c5a.2xlarge"          then AEC::InstanceType::C5a2xlarge
      when "c5a.4xlarge"          then AEC::InstanceType::C5a4xlarge
      when "c5a.8xlarge"          then AEC::InstanceType::C5a8xlarge
      when "c5a.12xlarge"         then AEC::InstanceType::C5a12xlarge
      when "c5a.16xlarge"         then AEC::InstanceType::C5a16xlarge
      when "c5a.24xlarge"         then AEC::InstanceType::C5a24xlarge
      when "c5ad.large"           then AEC::InstanceType::C5adLarge
      when "c5ad.xlarge"          then AEC::InstanceType::C5adXlarge
      when "c5ad.2xlarge"         then AEC::InstanceType::C5ad2xlarge
      when "c5ad.4xlarge"         then AEC::InstanceType::C5ad4xlarge
      when "c5ad.8xlarge"         then AEC::InstanceType::C5ad8xlarge
      when "c5ad.12xlarge"        then AEC::InstanceType::C5ad12xlarge
      when "c5ad.16xlarge"        then AEC::InstanceType::C5ad16xlarge
      when "c5ad.24xlarge"        then AEC::InstanceType::C5ad24xlarge
      when "c5d.large"            then AEC::InstanceType::C5dLarge
      when "c5d.xlarge"           then AEC::InstanceType::C5dXlarge
      when "c5d.2xlarge"          then AEC::InstanceType::C5d2xlarge
      when "c5d.4xlarge"          then AEC::InstanceType::C5d4xlarge
      when "c5d.9xlarge"          then AEC::InstanceType::C5d9xlarge
      when "c5d.12xlarge"         then AEC::InstanceType::C5d12xlarge
      when "c5d.18xlarge"         then AEC::InstanceType::C5d18xlarge
      when "c5d.24xlarge"         then AEC::InstanceType::C5d24xlarge
      when "c5d.metal"            then AEC::InstanceType::C5dMetal
      when "c5n.large"            then AEC::InstanceType::C5nLarge
      when "c5n.xlarge"           then AEC::InstanceType::C5nXlarge
      when "c5n.2xlarge"          then AEC::InstanceType::C5n2xlarge
      when "c5n.4xlarge"          then AEC::InstanceType::C5n4xlarge
      when "c5n.9xlarge"          then AEC::InstanceType::C5n9xlarge
      when "c5n.18xlarge"         then AEC::InstanceType::C5n18xlarge
      when "c5n.metal"            then AEC::InstanceType::C5nMetal
      when "c6g.medium"           then AEC::InstanceType::C6gMedium
      when "c6g.large"            then AEC::InstanceType::C6gLarge
      when "c6g.xlarge"           then AEC::InstanceType::C6gXlarge
      when "c6g.2xlarge"          then AEC::InstanceType::C6g2xlarge
      when "c6g.4xlarge"          then AEC::InstanceType::C6g4xlarge
      when "c6g.8xlarge"          then AEC::InstanceType::C6g8xlarge
      when "c6g.12xlarge"         then AEC::InstanceType::C6g12xlarge
      when "c6g.16xlarge"         then AEC::InstanceType::C6g16xlarge
      when "c6g.metal"            then AEC::InstanceType::C6gMetal
      when "c6gd.medium"          then AEC::InstanceType::C6gdMedium
      when "c6gd.large"           then AEC::InstanceType::C6gdLarge
      when "c6gd.xlarge"          then AEC::InstanceType::C6gdXlarge
      when "c6gd.2xlarge"         then AEC::InstanceType::C6gd2xlarge
      when "c6gd.4xlarge"         then AEC::InstanceType::C6gd4xlarge
      when "c6gd.8xlarge"         then AEC::InstanceType::C6gd8xlarge
      when "c6gd.12xlarge"        then AEC::InstanceType::C6gd12xlarge
      when "c6gd.16xlarge"        then AEC::InstanceType::C6gd16xlarge
      when "c6gd.metal"           then AEC::InstanceType::C6gdMetal
      when "c6gn.medium"          then AEC::InstanceType::C6gnMedium
      when "c6gn.large"           then AEC::InstanceType::C6gnLarge
      when "c6gn.xlarge"          then AEC::InstanceType::C6gnXlarge
      when "c6gn.2xlarge"         then AEC::InstanceType::C6gn2xlarge
      when "c6gn.4xlarge"         then AEC::InstanceType::C6gn4xlarge
      when "c6gn.8xlarge"         then AEC::InstanceType::C6gn8xlarge
      when "c6gn.12xlarge"        then AEC::InstanceType::C6gn12xlarge
      when "c6gn.16xlarge"        then AEC::InstanceType::C6gn16xlarge
      when "c6i.large"            then AEC::InstanceType::C6iLarge
      when "c6i.xlarge"           then AEC::InstanceType::C6iXlarge
      when "c6i.2xlarge"          then AEC::InstanceType::C6i2xlarge
      when "c6i.4xlarge"          then AEC::InstanceType::C6i4xlarge
      when "c6i.8xlarge"          then AEC::InstanceType::C6i8xlarge
      when "c6i.12xlarge"         then AEC::InstanceType::C6i12xlarge
      when "c6i.16xlarge"         then AEC::InstanceType::C6i16xlarge
      when "c6i.24xlarge"         then AEC::InstanceType::C6i24xlarge
      when "c6i.32xlarge"         then AEC::InstanceType::C6i32xlarge
      when "c6i.metal"            then AEC::InstanceType::C6iMetal
      when "cc1.4xlarge"          then AEC::InstanceType::Cc14xlarge
      when "cc2.8xlarge"          then AEC::InstanceType::Cc28xlarge
      when "cg1.4xlarge"          then AEC::InstanceType::Cg14xlarge
      when "cr1.8xlarge"          then AEC::InstanceType::Cr18xlarge
      when "d2.xlarge"            then AEC::InstanceType::D2Xlarge
      when "d2.2xlarge"           then AEC::InstanceType::D22xlarge
      when "d2.4xlarge"           then AEC::InstanceType::D24xlarge
      when "d2.8xlarge"           then AEC::InstanceType::D28xlarge
      when "d3.xlarge"            then AEC::InstanceType::D3Xlarge
      when "d3.2xlarge"           then AEC::InstanceType::D32xlarge
      when "d3.4xlarge"           then AEC::InstanceType::D34xlarge
      when "d3.8xlarge"           then AEC::InstanceType::D38xlarge
      when "d3en.xlarge"          then AEC::InstanceType::D3enXlarge
      when "d3en.2xlarge"         then AEC::InstanceType::D3en2xlarge
      when "d3en.4xlarge"         then AEC::InstanceType::D3en4xlarge
      when "d3en.6xlarge"         then AEC::InstanceType::D3en6xlarge
      when "d3en.8xlarge"         then AEC::InstanceType::D3en8xlarge
      when "d3en.12xlarge"        then AEC::InstanceType::D3en12xlarge
      when "dl1.24xlarge"         then AEC::InstanceType::Dl124xlarge
      when "f1.2xlarge"           then AEC::InstanceType::F12xlarge
      when "f1.4xlarge"           then AEC::InstanceType::F14xlarge
      when "f1.16xlarge"          then AEC::InstanceType::F116xlarge
      when "g2.2xlarge"           then AEC::InstanceType::G22xlarge
      when "g2.8xlarge"           then AEC::InstanceType::G28xlarge
      when "g3.4xlarge"           then AEC::InstanceType::G34xlarge
      when "g3.8xlarge"           then AEC::InstanceType::G38xlarge
      when "g3.16xlarge"          then AEC::InstanceType::G316xlarge
      when "g3s.xlarge"           then AEC::InstanceType::G3sXlarge
      when "g4ad.xlarge"          then AEC::InstanceType::G4adXlarge
      when "g4ad.2xlarge"         then AEC::InstanceType::G4ad2xlarge
      when "g4ad.4xlarge"         then AEC::InstanceType::G4ad4xlarge
      when "g4ad.8xlarge"         then AEC::InstanceType::G4ad8xlarge
      when "g4ad.16xlarge"        then AEC::InstanceType::G4ad16xlarge
      when "g4dn.xlarge"          then AEC::InstanceType::G4dnXlarge
      when "g4dn.2xlarge"         then AEC::InstanceType::G4dn2xlarge
      when "g4dn.4xlarge"         then AEC::InstanceType::G4dn4xlarge
      when "g4dn.8xlarge"         then AEC::InstanceType::G4dn8xlarge
      when "g4dn.12xlarge"        then AEC::InstanceType::G4dn12xlarge
      when "g4dn.16xlarge"        then AEC::InstanceType::G4dn16xlarge
      when "g4dn.metal"           then AEC::InstanceType::G4dnMetal
      when "g5.xlarge"            then AEC::InstanceType::G5Xlarge
      when "g5.2xlarge"           then AEC::InstanceType::G52xlarge
      when "g5.4xlarge"           then AEC::InstanceType::G54xlarge
      when "g5.8xlarge"           then AEC::InstanceType::G58xlarge
      when "g5.12xlarge"          then AEC::InstanceType::G512xlarge
      when "g5.16xlarge"          then AEC::InstanceType::G516xlarge
      when "g5.24xlarge"          then AEC::InstanceType::G524xlarge
      when "g5.48xlarge"          then AEC::InstanceType::G548xlarge
      when "g5g.xlarge"           then AEC::InstanceType::G5gXlarge
      when "g5g.2xlarge"          then AEC::InstanceType::G5g2xlarge
      when "g5g.4xlarge"          then AEC::InstanceType::G5g4xlarge
      when "g5g.8xlarge"          then AEC::InstanceType::G5g8xlarge
      when "g5g.16xlarge"         then AEC::InstanceType::G5g16xlarge
      when "g5g.metal"            then AEC::InstanceType::G5gMetal
      when "hi1.4xlarge"          then AEC::InstanceType::Hi14xlarge
      when "hpc6a.48xlarge"       then AEC::InstanceType::Hpc6a48xlarge
      when "hs1.8xlarge"          then AEC::InstanceType::Hs18xlarge
      when "h1.2xlarge"           then AEC::InstanceType::H12xlarge
      when "h1.4xlarge"           then AEC::InstanceType::H14xlarge
      when "h1.8xlarge"           then AEC::InstanceType::H18xlarge
      when "h1.16xlarge"          then AEC::InstanceType::H116xlarge
      when "i2.xlarge"            then AEC::InstanceType::I2Xlarge
      when "i2.2xlarge"           then AEC::InstanceType::I22xlarge
      when "i2.4xlarge"           then AEC::InstanceType::I24xlarge
      when "i2.8xlarge"           then AEC::InstanceType::I28xlarge
      when "i3.large"             then AEC::InstanceType::I3Large
      when "i3.xlarge"            then AEC::InstanceType::I3Xlarge
      when "i3.2xlarge"           then AEC::InstanceType::I32xlarge
      when "i3.4xlarge"           then AEC::InstanceType::I34xlarge
      when "i3.8xlarge"           then AEC::InstanceType::I38xlarge
      when "i3.16xlarge"          then AEC::InstanceType::I316xlarge
      when "i3.metal"             then AEC::InstanceType::I3Metal
      when "i3en.large"           then AEC::InstanceType::I3enLarge
      when "i3en.xlarge"          then AEC::InstanceType::I3enXlarge
      when "i3en.2xlarge"         then AEC::InstanceType::I3en2xlarge
      when "i3en.3xlarge"         then AEC::InstanceType::I3en3xlarge
      when "i3en.6xlarge"         then AEC::InstanceType::I3en6xlarge
      when "i3en.12xlarge"        then AEC::InstanceType::I3en12xlarge
      when "i3en.24xlarge"        then AEC::InstanceType::I3en24xlarge
      when "i3en.metal"           then AEC::InstanceType::I3enMetal
      when "im4gn.large"          then AEC::InstanceType::Im4gnLarge
      when "im4gn.xlarge"         then AEC::InstanceType::Im4gnXlarge
      when "im4gn.2xlarge"        then AEC::InstanceType::Im4gn2xlarge
      when "im4gn.4xlarge"        then AEC::InstanceType::Im4gn4xlarge
      when "im4gn.8xlarge"        then AEC::InstanceType::Im4gn8xlarge
      when "im4gn.16xlarge"       then AEC::InstanceType::Im4gn16xlarge
      when "inf1.xlarge"          then AEC::InstanceType::Inf1Xlarge
      when "inf1.2xlarge"         then AEC::InstanceType::Inf12xlarge
      when "inf1.6xlarge"         then AEC::InstanceType::Inf16xlarge
      when "inf1.24xlarge"        then AEC::InstanceType::Inf124xlarge
      when "is4gen.medium"        then AEC::InstanceType::Is4genMedium
      when "is4gen.large"         then AEC::InstanceType::Is4genLarge
      when "is4gen.xlarge"        then AEC::InstanceType::Is4genXlarge
      when "is4gen.2xlarge"       then AEC::InstanceType::Is4gen2xlarge
      when "is4gen.4xlarge"       then AEC::InstanceType::Is4gen4xlarge
      when "is4gen.8xlarge"       then AEC::InstanceType::Is4gen8xlarge
      when "m1.small"             then AEC::InstanceType::M1Small
      when "m1.medium"            then AEC::InstanceType::M1Medium
      when "m1.large"             then AEC::InstanceType::M1Large
      when "m1.xlarge"            then AEC::InstanceType::M1Xlarge
      when "m2.xlarge"            then AEC::InstanceType::M2Xlarge
      when "m2.2xlarge"           then AEC::InstanceType::M22xlarge
      when "m2.4xlarge"           then AEC::InstanceType::M24xlarge
      when "m3.medium"            then AEC::InstanceType::M3Medium
      when "m3.large"             then AEC::InstanceType::M3Large
      when "m3.xlarge"            then AEC::InstanceType::M3Xlarge
      when "m3.2xlarge"           then AEC::InstanceType::M32xlarge
      when "m4.large"             then AEC::InstanceType::M4Large
      when "m4.xlarge"            then AEC::InstanceType::M4Xlarge
      when "m4.2xlarge"           then AEC::InstanceType::M42xlarge
      when "m4.4xlarge"           then AEC::InstanceType::M44xlarge
      when "m4.10xlarge"          then AEC::InstanceType::M410xlarge
      when "m4.16xlarge"          then AEC::InstanceType::M416xlarge
      when "m5.large"             then AEC::InstanceType::M5Large
      when "m5.xlarge"            then AEC::InstanceType::M5Xlarge
      when "m5.2xlarge"           then AEC::InstanceType::M52xlarge
      when "m5.4xlarge"           then AEC::InstanceType::M54xlarge
      when "m5.8xlarge"           then AEC::InstanceType::M58xlarge
      when "m5.12xlarge"          then AEC::InstanceType::M512xlarge
      when "m5.16xlarge"          then AEC::InstanceType::M516xlarge
      when "m5.24xlarge"          then AEC::InstanceType::M524xlarge
      when "m5.metal"             then AEC::InstanceType::M5Metal
      when "m5a.large"            then AEC::InstanceType::M5aLarge
      when "m5a.xlarge"           then AEC::InstanceType::M5aXlarge
      when "m5a.2xlarge"          then AEC::InstanceType::M5a2xlarge
      when "m5a.4xlarge"          then AEC::InstanceType::M5a4xlarge
      when "m5a.8xlarge"          then AEC::InstanceType::M5a8xlarge
      when "m5a.12xlarge"         then AEC::InstanceType::M5a12xlarge
      when "m5a.16xlarge"         then AEC::InstanceType::M5a16xlarge
      when "m5a.24xlarge"         then AEC::InstanceType::M5a24xlarge
      when "m5ad.large"           then AEC::InstanceType::M5adLarge
      when "m5ad.xlarge"          then AEC::InstanceType::M5adXlarge
      when "m5ad.2xlarge"         then AEC::InstanceType::M5ad2xlarge
      when "m5ad.4xlarge"         then AEC::InstanceType::M5ad4xlarge
      when "m5ad.8xlarge"         then AEC::InstanceType::M5ad8xlarge
      when "m5ad.12xlarge"        then AEC::InstanceType::M5ad12xlarge
      when "m5ad.16xlarge"        then AEC::InstanceType::M5ad16xlarge
      when "m5ad.24xlarge"        then AEC::InstanceType::M5ad24xlarge
      when "m5d.large"            then AEC::InstanceType::M5dLarge
      when "m5d.xlarge"           then AEC::InstanceType::M5dXlarge
      when "m5d.2xlarge"          then AEC::InstanceType::M5d2xlarge
      when "m5d.4xlarge"          then AEC::InstanceType::M5d4xlarge
      when "m5d.8xlarge"          then AEC::InstanceType::M5d8xlarge
      when "m5d.12xlarge"         then AEC::InstanceType::M5d12xlarge
      when "m5d.16xlarge"         then AEC::InstanceType::M5d16xlarge
      when "m5d.24xlarge"         then AEC::InstanceType::M5d24xlarge
      when "m5d.metal"            then AEC::InstanceType::M5dMetal
      when "m5dn.large"           then AEC::InstanceType::M5dnLarge
      when "m5dn.xlarge"          then AEC::InstanceType::M5dnXlarge
      when "m5dn.2xlarge"         then AEC::InstanceType::M5dn2xlarge
      when "m5dn.4xlarge"         then AEC::InstanceType::M5dn4xlarge
      when "m5dn.8xlarge"         then AEC::InstanceType::M5dn8xlarge
      when "m5dn.12xlarge"        then AEC::InstanceType::M5dn12xlarge
      when "m5dn.16xlarge"        then AEC::InstanceType::M5dn16xlarge
      when "m5dn.24xlarge"        then AEC::InstanceType::M5dn24xlarge
      when "m5dn.metal"           then AEC::InstanceType::M5dnMetal
      when "m5n.large"            then AEC::InstanceType::M5nLarge
      when "m5n.xlarge"           then AEC::InstanceType::M5nXlarge
      when "m5n.2xlarge"          then AEC::InstanceType::M5n2xlarge
      when "m5n.4xlarge"          then AEC::InstanceType::M5n4xlarge
      when "m5n.8xlarge"          then AEC::InstanceType::M5n8xlarge
      when "m5n.12xlarge"         then AEC::InstanceType::M5n12xlarge
      when "m5n.16xlarge"         then AEC::InstanceType::M5n16xlarge
      when "m5n.24xlarge"         then AEC::InstanceType::M5n24xlarge
      when "m5n.metal"            then AEC::InstanceType::M5nMetal
      when "m5zn.large"           then AEC::InstanceType::M5znLarge
      when "m5zn.xlarge"          then AEC::InstanceType::M5znXlarge
      when "m5zn.2xlarge"         then AEC::InstanceType::M5zn2xlarge
      when "m5zn.3xlarge"         then AEC::InstanceType::M5zn3xlarge
      when "m5zn.6xlarge"         then AEC::InstanceType::M5zn6xlarge
      when "m5zn.12xlarge"        then AEC::InstanceType::M5zn12xlarge
      when "m5zn.metal"           then AEC::InstanceType::M5znMetal
      when "m6a.large"            then AEC::InstanceType::M6aLarge
      when "m6a.xlarge"           then AEC::InstanceType::M6aXlarge
      when "m6a.2xlarge"          then AEC::InstanceType::M6a2xlarge
      when "m6a.4xlarge"          then AEC::InstanceType::M6a4xlarge
      when "m6a.8xlarge"          then AEC::InstanceType::M6a8xlarge
      when "m6a.12xlarge"         then AEC::InstanceType::M6a12xlarge
      when "m6a.16xlarge"         then AEC::InstanceType::M6a16xlarge
      when "m6a.24xlarge"         then AEC::InstanceType::M6a24xlarge
      when "m6a.32xlarge"         then AEC::InstanceType::M6a32xlarge
      when "m6a.48xlarge"         then AEC::InstanceType::M6a48xlarge
      when "m6g.metal"            then AEC::InstanceType::M6gMetal
      when "m6g.medium"           then AEC::InstanceType::M6gMedium
      when "m6g.large"            then AEC::InstanceType::M6gLarge
      when "m6g.xlarge"           then AEC::InstanceType::M6gXlarge
      when "m6g.2xlarge"          then AEC::InstanceType::M6g2xlarge
      when "m6g.4xlarge"          then AEC::InstanceType::M6g4xlarge
      when "m6g.8xlarge"          then AEC::InstanceType::M6g8xlarge
      when "m6g.12xlarge"         then AEC::InstanceType::M6g12xlarge
      when "m6g.16xlarge"         then AEC::InstanceType::M6g16xlarge
      when "m6gd.metal"           then AEC::InstanceType::M6gdMetal
      when "m6gd.medium"          then AEC::InstanceType::M6gdMedium
      when "m6gd.large"           then AEC::InstanceType::M6gdLarge
      when "m6gd.xlarge"          then AEC::InstanceType::M6gdXlarge
      when "m6gd.2xlarge"         then AEC::InstanceType::M6gd2xlarge
      when "m6gd.4xlarge"         then AEC::InstanceType::M6gd4xlarge
      when "m6gd.8xlarge"         then AEC::InstanceType::M6gd8xlarge
      when "m6gd.12xlarge"        then AEC::InstanceType::M6gd12xlarge
      when "m6gd.16xlarge"        then AEC::InstanceType::M6gd16xlarge
      when "m6i.large"            then AEC::InstanceType::M6iLarge
      when "m6i.xlarge"           then AEC::InstanceType::M6iXlarge
      when "m6i.2xlarge"          then AEC::InstanceType::M6i2xlarge
      when "m6i.4xlarge"          then AEC::InstanceType::M6i4xlarge
      when "m6i.8xlarge"          then AEC::InstanceType::M6i8xlarge
      when "m6i.12xlarge"         then AEC::InstanceType::M6i12xlarge
      when "m6i.16xlarge"         then AEC::InstanceType::M6i16xlarge
      when "m6i.24xlarge"         then AEC::InstanceType::M6i24xlarge
      when "m6i.32xlarge"         then AEC::InstanceType::M6i32xlarge
      when "m6i.metal"            then AEC::InstanceType::M6iMetal
      when "mac1.metal"           then AEC::InstanceType::Mac1Metal
      when "p2.xlarge"            then AEC::InstanceType::P2Xlarge
      when "p2.8xlarge"           then AEC::InstanceType::P28xlarge
      when "p2.16xlarge"          then AEC::InstanceType::P216xlarge
      when "p3.2xlarge"           then AEC::InstanceType::P32xlarge
      when "p3.8xlarge"           then AEC::InstanceType::P38xlarge
      when "p3.16xlarge"          then AEC::InstanceType::P316xlarge
      when "p3dn.24xlarge"        then AEC::InstanceType::P3dn24xlarge
      when "p4d.24xlarge"         then AEC::InstanceType::P4d24xlarge
      when "r3.large"             then AEC::InstanceType::R3Large
      when "r3.xlarge"            then AEC::InstanceType::R3Xlarge
      when "r3.2xlarge"           then AEC::InstanceType::R32xlarge
      when "r3.4xlarge"           then AEC::InstanceType::R34xlarge
      when "r3.8xlarge"           then AEC::InstanceType::R38xlarge
      when "r4.large"             then AEC::InstanceType::R4Large
      when "r4.xlarge"            then AEC::InstanceType::R4Xlarge
      when "r4.2xlarge"           then AEC::InstanceType::R42xlarge
      when "r4.4xlarge"           then AEC::InstanceType::R44xlarge
      when "r4.8xlarge"           then AEC::InstanceType::R48xlarge
      when "r4.16xlarge"          then AEC::InstanceType::R416xlarge
      when "r5.large"             then AEC::InstanceType::R5Large
      when "r5.xlarge"            then AEC::InstanceType::R5Xlarge
      when "r5.2xlarge"           then AEC::InstanceType::R52xlarge
      when "r5.4xlarge"           then AEC::InstanceType::R54xlarge
      when "r5.8xlarge"           then AEC::InstanceType::R58xlarge
      when "r5.12xlarge"          then AEC::InstanceType::R512xlarge
      when "r5.16xlarge"          then AEC::InstanceType::R516xlarge
      when "r5.24xlarge"          then AEC::InstanceType::R524xlarge
      when "r5.metal"             then AEC::InstanceType::R5Metal
      when "r5a.large"            then AEC::InstanceType::R5aLarge
      when "r5a.xlarge"           then AEC::InstanceType::R5aXlarge
      when "r5a.2xlarge"          then AEC::InstanceType::R5a2xlarge
      when "r5a.4xlarge"          then AEC::InstanceType::R5a4xlarge
      when "r5a.8xlarge"          then AEC::InstanceType::R5a8xlarge
      when "r5a.12xlarge"         then AEC::InstanceType::R5a12xlarge
      when "r5a.16xlarge"         then AEC::InstanceType::R5a16xlarge
      when "r5a.24xlarge"         then AEC::InstanceType::R5a24xlarge
      when "r5ad.large"           then AEC::InstanceType::R5adLarge
      when "r5ad.xlarge"          then AEC::InstanceType::R5adXlarge
      when "r5ad.2xlarge"         then AEC::InstanceType::R5ad2xlarge
      when "r5ad.4xlarge"         then AEC::InstanceType::R5ad4xlarge
      when "r5ad.8xlarge"         then AEC::InstanceType::R5ad8xlarge
      when "r5ad.12xlarge"        then AEC::InstanceType::R5ad12xlarge
      when "r5ad.16xlarge"        then AEC::InstanceType::R5ad16xlarge
      when "r5ad.24xlarge"        then AEC::InstanceType::R5ad24xlarge
      when "r5b.large"            then AEC::InstanceType::R5bLarge
      when "r5b.xlarge"           then AEC::InstanceType::R5bXlarge
      when "r5b.2xlarge"          then AEC::InstanceType::R5b2xlarge
      when "r5b.4xlarge"          then AEC::InstanceType::R5b4xlarge
      when "r5b.8xlarge"          then AEC::InstanceType::R5b8xlarge
      when "r5b.12xlarge"         then AEC::InstanceType::R5b12xlarge
      when "r5b.16xlarge"         then AEC::InstanceType::R5b16xlarge
      when "r5b.24xlarge"         then AEC::InstanceType::R5b24xlarge
      when "r5b.metal"            then AEC::InstanceType::R5bMetal
      when "r5d.large"            then AEC::InstanceType::R5dLarge
      when "r5d.xlarge"           then AEC::InstanceType::R5dXlarge
      when "r5d.2xlarge"          then AEC::InstanceType::R5d2xlarge
      when "r5d.4xlarge"          then AEC::InstanceType::R5d4xlarge
      when "r5d.8xlarge"          then AEC::InstanceType::R5d8xlarge
      when "r5d.12xlarge"         then AEC::InstanceType::R5d12xlarge
      when "r5d.16xlarge"         then AEC::InstanceType::R5d16xlarge
      when "r5d.24xlarge"         then AEC::InstanceType::R5d24xlarge
      when "r5d.metal"            then AEC::InstanceType::R5dMetal
      when "r5dn.large"           then AEC::InstanceType::R5dnLarge
      when "r5dn.xlarge"          then AEC::InstanceType::R5dnXlarge
      when "r5dn.2xlarge"         then AEC::InstanceType::R5dn2xlarge
      when "r5dn.4xlarge"         then AEC::InstanceType::R5dn4xlarge
      when "r5dn.8xlarge"         then AEC::InstanceType::R5dn8xlarge
      when "r5dn.12xlarge"        then AEC::InstanceType::R5dn12xlarge
      when "r5dn.16xlarge"        then AEC::InstanceType::R5dn16xlarge
      when "r5dn.24xlarge"        then AEC::InstanceType::R5dn24xlarge
      when "r5dn.metal"           then AEC::InstanceType::R5dnMetal
      when "r5n.large"            then AEC::InstanceType::R5nLarge
      when "r5n.xlarge"           then AEC::InstanceType::R5nXlarge
      when "r5n.2xlarge"          then AEC::InstanceType::R5n2xlarge
      when "r5n.4xlarge"          then AEC::InstanceType::R5n4xlarge
      when "r5n.8xlarge"          then AEC::InstanceType::R5n8xlarge
      when "r5n.12xlarge"         then AEC::InstanceType::R5n12xlarge
      when "r5n.16xlarge"         then AEC::InstanceType::R5n16xlarge
      when "r5n.24xlarge"         then AEC::InstanceType::R5n24xlarge
      when "r5n.metal"            then AEC::InstanceType::R5nMetal
      when "r6g.medium"           then AEC::InstanceType::R6gMedium
      when "r6g.large"            then AEC::InstanceType::R6gLarge
      when "r6g.xlarge"           then AEC::InstanceType::R6gXlarge
      when "r6g.2xlarge"          then AEC::InstanceType::R6g2xlarge
      when "r6g.4xlarge"          then AEC::InstanceType::R6g4xlarge
      when "r6g.8xlarge"          then AEC::InstanceType::R6g8xlarge
      when "r6g.12xlarge"         then AEC::InstanceType::R6g12xlarge
      when "r6g.16xlarge"         then AEC::InstanceType::R6g16xlarge
      when "r6g.metal"            then AEC::InstanceType::R6gMetal
      when "r6gd.medium"          then AEC::InstanceType::R6gdMedium
      when "r6gd.large"           then AEC::InstanceType::R6gdLarge
      when "r6gd.xlarge"          then AEC::InstanceType::R6gdXlarge
      when "r6gd.2xlarge"         then AEC::InstanceType::R6gd2xlarge
      when "r6gd.4xlarge"         then AEC::InstanceType::R6gd4xlarge
      when "r6gd.8xlarge"         then AEC::InstanceType::R6gd8xlarge
      when "r6gd.12xlarge"        then AEC::InstanceType::R6gd12xlarge
      when "r6gd.16xlarge"        then AEC::InstanceType::R6gd16xlarge
      when "r6gd.metal"           then AEC::InstanceType::R6gdMetal
      when "r6i.large"            then AEC::InstanceType::R6iLarge
      when "r6i.xlarge"           then AEC::InstanceType::R6iXlarge
      when "r6i.2xlarge"          then AEC::InstanceType::R6i2xlarge
      when "r6i.4xlarge"          then AEC::InstanceType::R6i4xlarge
      when "r6i.8xlarge"          then AEC::InstanceType::R6i8xlarge
      when "r6i.12xlarge"         then AEC::InstanceType::R6i12xlarge
      when "r6i.16xlarge"         then AEC::InstanceType::R6i16xlarge
      when "r6i.24xlarge"         then AEC::InstanceType::R6i24xlarge
      when "r6i.32xlarge"         then AEC::InstanceType::R6i32xlarge
      when "r6i.metal"            then AEC::InstanceType::R6iMetal
      when "t1.micro"             then AEC::InstanceType::T1Micro
      when "t2.nano"              then AEC::InstanceType::T2Nano
      when "t2.micro"             then AEC::InstanceType::T2Micro
      when "t2.small"             then AEC::InstanceType::T2Small
      when "t2.medium"            then AEC::InstanceType::T2Medium
      when "t2.large"             then AEC::InstanceType::T2Large
      when "t2.xlarge"            then AEC::InstanceType::T2Xlarge
      when "t2.2xlarge"           then AEC::InstanceType::T22xlarge
      when "t3.nano"              then AEC::InstanceType::T3Nano
      when "t3.micro"             then AEC::InstanceType::T3Micro
      when "t3.small"             then AEC::InstanceType::T3Small
      when "t3.medium"            then AEC::InstanceType::T3Medium
      when "t3.large"             then AEC::InstanceType::T3Large
      when "t3.xlarge"            then AEC::InstanceType::T3Xlarge
      when "t3.2xlarge"           then AEC::InstanceType::T32xlarge
      when "t3a.nano"             then AEC::InstanceType::T3aNano
      when "t3a.micro"            then AEC::InstanceType::T3aMicro
      when "t3a.small"            then AEC::InstanceType::T3aSmall
      when "t3a.medium"           then AEC::InstanceType::T3aMedium
      when "t3a.large"            then AEC::InstanceType::T3aLarge
      when "t3a.xlarge"           then AEC::InstanceType::T3aXlarge
      when "t3a.2xlarge"          then AEC::InstanceType::T3a2xlarge
      when "t4g.nano"             then AEC::InstanceType::T4gNano
      when "t4g.micro"            then AEC::InstanceType::T4gMicro
      when "t4g.small"            then AEC::InstanceType::T4gSmall
      when "t4g.medium"           then AEC::InstanceType::T4gMedium
      when "t4g.large"            then AEC::InstanceType::T4gLarge
      when "t4g.xlarge"           then AEC::InstanceType::T4gXlarge
      when "t4g.2xlarge"          then AEC::InstanceType::T4g2xlarge
      when "u-6tb1.56xlarge"      then AEC::InstanceType::U6tb156xlarge
      when "u-6tb1.112xlarge"     then AEC::InstanceType::U6tb1112xlarge
      when "u-9tb1.112xlarge"     then AEC::InstanceType::U9tb1112xlarge
      when "u-12tb1.112xlarge"    then AEC::InstanceType::U12tb1112xlarge
      when "u-6tb1.metal"         then AEC::InstanceType::U6tb1Metal
      when "u-9tb1.metal"         then AEC::InstanceType::U9tb1Metal
      when "u-12tb1.metal"        then AEC::InstanceType::U12tb1Metal
      when "u-18tb1.metal"        then AEC::InstanceType::U18tb1Metal
      when "u-24tb1.metal"        then AEC::InstanceType::U24tb1Metal
      when "vt1.3xlarge"          then AEC::InstanceType::Vt13xlarge
      when "vt1.6xlarge"          then AEC::InstanceType::Vt16xlarge
      when "vt1.24xlarge"         then AEC::InstanceType::Vt124xlarge
      when "x1.16xlarge"          then AEC::InstanceType::X116xlarge
      when "x1.32xlarge"          then AEC::InstanceType::X132xlarge
      when "x1e.xlarge"           then AEC::InstanceType::X1eXlarge
      when "x1e.2xlarge"          then AEC::InstanceType::X1e2xlarge
      when "x1e.4xlarge"          then AEC::InstanceType::X1e4xlarge
      when "x1e.8xlarge"          then AEC::InstanceType::X1e8xlarge
      when "x1e.16xlarge"         then AEC::InstanceType::X1e16xlarge
      when "x1e.32xlarge"         then AEC::InstanceType::X1e32xlarge
      when "x2iezn.2xlarge"       then AEC::InstanceType::X2iezn2xlarge
      when "x2iezn.4xlarge"       then AEC::InstanceType::X2iezn4xlarge
      when "x2iezn.6xlarge"       then AEC::InstanceType::X2iezn6xlarge
      when "x2iezn.8xlarge"       then AEC::InstanceType::X2iezn8xlarge
      when "x2iezn.12xlarge"      then AEC::InstanceType::X2iezn12xlarge
      when "x2iezn.metal"         then AEC::InstanceType::X2ieznMetal
      when "x2gd.medium"          then AEC::InstanceType::X2gdMedium
      when "x2gd.large"           then AEC::InstanceType::X2gdLarge
      when "x2gd.xlarge"          then AEC::InstanceType::X2gdXlarge
      when "x2gd.2xlarge"         then AEC::InstanceType::X2gd2xlarge
      when "x2gd.4xlarge"         then AEC::InstanceType::X2gd4xlarge
      when "x2gd.8xlarge"         then AEC::InstanceType::X2gd8xlarge
      when "x2gd.12xlarge"        then AEC::InstanceType::X2gd12xlarge
      when "x2gd.16xlarge"        then AEC::InstanceType::X2gd16xlarge
      when "x2gd.metal"           then AEC::InstanceType::X2gdMetal
      when "z1d.large"            then AEC::InstanceType::Z1dLarge
      when "z1d.xlarge"           then AEC::InstanceType::Z1dXlarge
      when "z1d.2xlarge"          then AEC::InstanceType::Z1d2xlarge
      when "z1d.3xlarge"          then AEC::InstanceType::Z1d3xlarge
      when "z1d.6xlarge"          then AEC::InstanceType::Z1d6xlarge
      when "z1d.12xlarge"         then AEC::InstanceType::Z1d12xlarge
      when "z1d.metal"            then AEC::InstanceType::Z1dMetal
      when "x2idn.16xlarge"       then AEC::InstanceType::X2idn16xlarge
      when "x2idn.24xlarge"       then AEC::InstanceType::X2idn24xlarge
      when "x2idn.32xlarge"       then AEC::InstanceType::X2idn32xlarge
      when "x2iedn.xlarge"        then AEC::InstanceType::X2iednXlarge
      when "x2iedn.2xlarge"       then AEC::InstanceType::X2iedn2xlarge
      when "x2iedn.4xlarge"       then AEC::InstanceType::X2iedn4xlarge
      when "x2iedn.8xlarge"       then AEC::InstanceType::X2iedn8xlarge
      when "x2iedn.16xlarge"      then AEC::InstanceType::X2iedn16xlarge
      when "x2iedn.24xlarge"      then AEC::InstanceType::X2iedn24xlarge
      when "x2iedn.32xlarge"      then AEC::InstanceType::X2iedn32xlarge
      when "c6a.large"            then AEC::InstanceType::C6aLarge
      when "c6a.xlarge"           then AEC::InstanceType::C6aXlarge
      when "c6a.2xlarge"          then AEC::InstanceType::C6a2xlarge
      when "c6a.4xlarge"          then AEC::InstanceType::C6a4xlarge
      when "c6a.8xlarge"          then AEC::InstanceType::C6a8xlarge
      when "c6a.12xlarge"         then AEC::InstanceType::C6a12xlarge
      when "c6a.16xlarge"         then AEC::InstanceType::C6a16xlarge
      when "c6a.24xlarge"         then AEC::InstanceType::C6a24xlarge
      when "c6a.32xlarge"         then AEC::InstanceType::C6a32xlarge
      when "c6a.48xlarge"         then AEC::InstanceType::C6a48xlarge
      when "c6a.metal"            then AEC::InstanceType::C6aMetal
      when "m6a.metal"            then AEC::InstanceType::M6aMetal
      when "i4i.large"            then AEC::InstanceType::I4iLarge
      when "i4i.xlarge"           then AEC::InstanceType::I4iXlarge
      when "i4i.2xlarge"          then AEC::InstanceType::I4i2xlarge
      when "i4i.4xlarge"          then AEC::InstanceType::I4i4xlarge
      when "i4i.8xlarge"          then AEC::InstanceType::I4i8xlarge
      when "i4i.16xlarge"         then AEC::InstanceType::I4i16xlarge
      when "i4i.32xlarge"         then AEC::InstanceType::I4i32xlarge
      when "i4i.metal"            then AEC::InstanceType::I4iMetal
      when "x2idn.metal"          then AEC::InstanceType::X2idnMetal
      when "x2iedn.metal"         then AEC::InstanceType::X2iednMetal
      when "c7g.medium"           then AEC::InstanceType::C7gMedium
      when "c7g.large"            then AEC::InstanceType::C7gLarge
      when "c7g.xlarge"           then AEC::InstanceType::C7gXlarge
      when "c7g.2xlarge"          then AEC::InstanceType::C7g2xlarge
      when "c7g.4xlarge"          then AEC::InstanceType::C7g4xlarge
      when "c7g.8xlarge"          then AEC::InstanceType::C7g8xlarge
      when "c7g.12xlarge"         then AEC::InstanceType::C7g12xlarge
      when "c7g.16xlarge"         then AEC::InstanceType::C7g16xlarge
      when "mac2.metal"           then AEC::InstanceType::Mac2Metal
      when "c6id.large"           then AEC::InstanceType::C6idLarge
      when "c6id.xlarge"          then AEC::InstanceType::C6idXlarge
      when "c6id.2xlarge"         then AEC::InstanceType::C6id2xlarge
      when "c6id.4xlarge"         then AEC::InstanceType::C6id4xlarge
      when "c6id.8xlarge"         then AEC::InstanceType::C6id8xlarge
      when "c6id.12xlarge"        then AEC::InstanceType::C6id12xlarge
      when "c6id.16xlarge"        then AEC::InstanceType::C6id16xlarge
      when "c6id.24xlarge"        then AEC::InstanceType::C6id24xlarge
      when "c6id.32xlarge"        then AEC::InstanceType::C6id32xlarge
      when "c6id.metal"           then AEC::InstanceType::C6idMetal
      when "m6id.large"           then AEC::InstanceType::M6idLarge
      when "m6id.xlarge"          then AEC::InstanceType::M6idXlarge
      when "m6id.2xlarge"         then AEC::InstanceType::M6id2xlarge
      when "m6id.4xlarge"         then AEC::InstanceType::M6id4xlarge
      when "m6id.8xlarge"         then AEC::InstanceType::M6id8xlarge
      when "m6id.12xlarge"        then AEC::InstanceType::M6id12xlarge
      when "m6id.16xlarge"        then AEC::InstanceType::M6id16xlarge
      when "m6id.24xlarge"        then AEC::InstanceType::M6id24xlarge
      when "m6id.32xlarge"        then AEC::InstanceType::M6id32xlarge
      when "m6id.metal"           then AEC::InstanceType::M6idMetal
      when "r6id.large"           then AEC::InstanceType::R6idLarge
      when "r6id.xlarge"          then AEC::InstanceType::R6idXlarge
      when "r6id.2xlarge"         then AEC::InstanceType::R6id2xlarge
      when "r6id.4xlarge"         then AEC::InstanceType::R6id4xlarge
      when "r6id.8xlarge"         then AEC::InstanceType::R6id8xlarge
      when "r6id.12xlarge"        then AEC::InstanceType::R6id12xlarge
      when "r6id.16xlarge"        then AEC::InstanceType::R6id16xlarge
      when "r6id.24xlarge"        then AEC::InstanceType::R6id24xlarge
      when "r6id.32xlarge"        then AEC::InstanceType::R6id32xlarge
      when "r6id.metal"           then AEC::InstanceType::R6idMetal
      when "r6a.large"            then AEC::InstanceType::R6aLarge
      when "r6a.xlarge"           then AEC::InstanceType::R6aXlarge
      when "r6a.2xlarge"          then AEC::InstanceType::R6a2xlarge
      when "r6a.4xlarge"          then AEC::InstanceType::R6a4xlarge
      when "r6a.8xlarge"          then AEC::InstanceType::R6a8xlarge
      when "r6a.12xlarge"         then AEC::InstanceType::R6a12xlarge
      when "r6a.16xlarge"         then AEC::InstanceType::R6a16xlarge
      when "r6a.24xlarge"         then AEC::InstanceType::R6a24xlarge
      when "r6a.32xlarge"         then AEC::InstanceType::R6a32xlarge
      when "r6a.48xlarge"         then AEC::InstanceType::R6a48xlarge
      when "r6a.metal"            then AEC::InstanceType::R6aMetal
      when "p4de.24xlarge"        then AEC::InstanceType::P4de24xlarge
      when "u-3tb1.56xlarge"      then AEC::InstanceType::U3tb156xlarge
      when "u-18tb1.112xlarge"    then AEC::InstanceType::U18tb1112xlarge
      when "u-24tb1.112xlarge"    then AEC::InstanceType::U24tb1112xlarge
      when "trn1.2xlarge"         then AEC::InstanceType::Trn12xlarge
      when "trn1.32xlarge"        then AEC::InstanceType::Trn132xlarge
      when "hpc6id.32xlarge"      then AEC::InstanceType::Hpc6id32xlarge
      when "c6in.large"           then AEC::InstanceType::C6inLarge
      when "c6in.xlarge"          then AEC::InstanceType::C6inXlarge
      when "c6in.2xlarge"         then AEC::InstanceType::C6in2xlarge
      when "c6in.4xlarge"         then AEC::InstanceType::C6in4xlarge
      when "c6in.8xlarge"         then AEC::InstanceType::C6in8xlarge
      when "c6in.12xlarge"        then AEC::InstanceType::C6in12xlarge
      when "c6in.16xlarge"        then AEC::InstanceType::C6in16xlarge
      when "c6in.24xlarge"        then AEC::InstanceType::C6in24xlarge
      when "c6in.32xlarge"        then AEC::InstanceType::C6in32xlarge
      when "m6in.large"           then AEC::InstanceType::M6inLarge
      when "m6in.xlarge"          then AEC::InstanceType::M6inXlarge
      when "m6in.2xlarge"         then AEC::InstanceType::M6in2xlarge
      when "m6in.4xlarge"         then AEC::InstanceType::M6in4xlarge
      when "m6in.8xlarge"         then AEC::InstanceType::M6in8xlarge
      when "m6in.12xlarge"        then AEC::InstanceType::M6in12xlarge
      when "m6in.16xlarge"        then AEC::InstanceType::M6in16xlarge
      when "m6in.24xlarge"        then AEC::InstanceType::M6in24xlarge
      when "m6in.32xlarge"        then AEC::InstanceType::M6in32xlarge
      when "m6idn.large"          then AEC::InstanceType::M6idnLarge
      when "m6idn.xlarge"         then AEC::InstanceType::M6idnXlarge
      when "m6idn.2xlarge"        then AEC::InstanceType::M6idn2xlarge
      when "m6idn.4xlarge"        then AEC::InstanceType::M6idn4xlarge
      when "m6idn.8xlarge"        then AEC::InstanceType::M6idn8xlarge
      when "m6idn.12xlarge"       then AEC::InstanceType::M6idn12xlarge
      when "m6idn.16xlarge"       then AEC::InstanceType::M6idn16xlarge
      when "m6idn.24xlarge"       then AEC::InstanceType::M6idn24xlarge
      when "m6idn.32xlarge"       then AEC::InstanceType::M6idn32xlarge
      when "r6in.large"           then AEC::InstanceType::R6inLarge
      when "r6in.xlarge"          then AEC::InstanceType::R6inXlarge
      when "r6in.2xlarge"         then AEC::InstanceType::R6in2xlarge
      when "r6in.4xlarge"         then AEC::InstanceType::R6in4xlarge
      when "r6in.8xlarge"         then AEC::InstanceType::R6in8xlarge
      when "r6in.12xlarge"        then AEC::InstanceType::R6in12xlarge
      when "r6in.16xlarge"        then AEC::InstanceType::R6in16xlarge
      when "r6in.24xlarge"        then AEC::InstanceType::R6in24xlarge
      when "r6in.32xlarge"        then AEC::InstanceType::R6in32xlarge
      when "r6idn.large"          then AEC::InstanceType::R6idnLarge
      when "r6idn.xlarge"         then AEC::InstanceType::R6idnXlarge
      when "r6idn.2xlarge"        then AEC::InstanceType::R6idn2xlarge
      when "r6idn.4xlarge"        then AEC::InstanceType::R6idn4xlarge
      when "r6idn.8xlarge"        then AEC::InstanceType::R6idn8xlarge
      when "r6idn.12xlarge"       then AEC::InstanceType::R6idn12xlarge
      when "r6idn.16xlarge"       then AEC::InstanceType::R6idn16xlarge
      when "r6idn.24xlarge"       then AEC::InstanceType::R6idn24xlarge
      when "r6idn.32xlarge"       then AEC::InstanceType::R6idn32xlarge
      when "c7g.metal"            then AEC::InstanceType::C7gMetal
      when "m7g.medium"           then AEC::InstanceType::M7gMedium
      when "m7g.large"            then AEC::InstanceType::M7gLarge
      when "m7g.xlarge"           then AEC::InstanceType::M7gXlarge
      when "m7g.2xlarge"          then AEC::InstanceType::M7g2xlarge
      when "m7g.4xlarge"          then AEC::InstanceType::M7g4xlarge
      when "m7g.8xlarge"          then AEC::InstanceType::M7g8xlarge
      when "m7g.12xlarge"         then AEC::InstanceType::M7g12xlarge
      when "m7g.16xlarge"         then AEC::InstanceType::M7g16xlarge
      when "m7g.metal"            then AEC::InstanceType::M7gMetal
      when "r7g.medium"           then AEC::InstanceType::R7gMedium
      when "r7g.large"            then AEC::InstanceType::R7gLarge
      when "r7g.xlarge"           then AEC::InstanceType::R7gXlarge
      when "r7g.2xlarge"          then AEC::InstanceType::R7g2xlarge
      when "r7g.4xlarge"          then AEC::InstanceType::R7g4xlarge
      when "r7g.8xlarge"          then AEC::InstanceType::R7g8xlarge
      when "r7g.12xlarge"         then AEC::InstanceType::R7g12xlarge
      when "r7g.16xlarge"         then AEC::InstanceType::R7g16xlarge
      when "r7g.metal"            then AEC::InstanceType::R7gMetal
      when "c6in.metal"           then AEC::InstanceType::C6inMetal
      when "m6in.metal"           then AEC::InstanceType::M6inMetal
      when "m6idn.metal"          then AEC::InstanceType::M6idnMetal
      when "r6in.metal"           then AEC::InstanceType::R6inMetal
      when "r6idn.metal"          then AEC::InstanceType::R6idnMetal
      when "inf2.xlarge"          then AEC::InstanceType::Inf2Xlarge
      when "inf2.8xlarge"         then AEC::InstanceType::Inf28xlarge
      when "inf2.24xlarge"        then AEC::InstanceType::Inf224xlarge
      when "inf2.48xlarge"        then AEC::InstanceType::Inf248xlarge
      when "trn1n.32xlarge"       then AEC::InstanceType::Trn1n32xlarge
      when "i4g.large"            then AEC::InstanceType::I4gLarge
      when "i4g.xlarge"           then AEC::InstanceType::I4gXlarge
      when "i4g.2xlarge"          then AEC::InstanceType::I4g2xlarge
      when "i4g.4xlarge"          then AEC::InstanceType::I4g4xlarge
      when "i4g.8xlarge"          then AEC::InstanceType::I4g8xlarge
      when "i4g.16xlarge"         then AEC::InstanceType::I4g16xlarge
      when "hpc7g.4xlarge"        then AEC::InstanceType::Hpc7g4xlarge
      when "hpc7g.8xlarge"        then AEC::InstanceType::Hpc7g8xlarge
      when "hpc7g.16xlarge"       then AEC::InstanceType::Hpc7g16xlarge
      when "c7gn.medium"          then AEC::InstanceType::C7gnMedium
      when "c7gn.large"           then AEC::InstanceType::C7gnLarge
      when "c7gn.xlarge"          then AEC::InstanceType::C7gnXlarge
      when "c7gn.2xlarge"         then AEC::InstanceType::C7gn2xlarge
      when "c7gn.4xlarge"         then AEC::InstanceType::C7gn4xlarge
      when "c7gn.8xlarge"         then AEC::InstanceType::C7gn8xlarge
      when "c7gn.12xlarge"        then AEC::InstanceType::C7gn12xlarge
      when "c7gn.16xlarge"        then AEC::InstanceType::C7gn16xlarge
      when "p5.48xlarge"          then AEC::InstanceType::P548xlarge
      when "m7i.large"            then AEC::InstanceType::M7iLarge
      when "m7i.xlarge"           then AEC::InstanceType::M7iXlarge
      when "m7i.2xlarge"          then AEC::InstanceType::M7i2xlarge
      when "m7i.4xlarge"          then AEC::InstanceType::M7i4xlarge
      when "m7i.8xlarge"          then AEC::InstanceType::M7i8xlarge
      when "m7i.12xlarge"         then AEC::InstanceType::M7i12xlarge
      when "m7i.16xlarge"         then AEC::InstanceType::M7i16xlarge
      when "m7i.24xlarge"         then AEC::InstanceType::M7i24xlarge
      when "m7i.48xlarge"         then AEC::InstanceType::M7i48xlarge
      when "m7i-flex.large"       then AEC::InstanceType::M7iFlexLarge
      when "m7i-flex.xlarge"      then AEC::InstanceType::M7iFlexXlarge
      when "m7i-flex.2xlarge"     then AEC::InstanceType::M7iFlex2xlarge
      when "m7i-flex.4xlarge"     then AEC::InstanceType::M7iFlex4xlarge
      when "m7i-flex.8xlarge"     then AEC::InstanceType::M7iFlex8xlarge
      when "m7a.medium"           then AEC::InstanceType::M7aMedium
      when "m7a.large"            then AEC::InstanceType::M7aLarge
      when "m7a.xlarge"           then AEC::InstanceType::M7aXlarge
      when "m7a.2xlarge"          then AEC::InstanceType::M7a2xlarge
      when "m7a.4xlarge"          then AEC::InstanceType::M7a4xlarge
      when "m7a.8xlarge"          then AEC::InstanceType::M7a8xlarge
      when "m7a.12xlarge"         then AEC::InstanceType::M7a12xlarge
      when "m7a.16xlarge"         then AEC::InstanceType::M7a16xlarge
      when "m7a.24xlarge"         then AEC::InstanceType::M7a24xlarge
      when "m7a.32xlarge"         then AEC::InstanceType::M7a32xlarge
      when "m7a.48xlarge"         then AEC::InstanceType::M7a48xlarge
      when "m7a.metal-48xl"       then AEC::InstanceType::M7aMetal48xl
      when "hpc7a.12xlarge"       then AEC::InstanceType::Hpc7a12xlarge
      when "hpc7a.24xlarge"       then AEC::InstanceType::Hpc7a24xlarge
      when "hpc7a.48xlarge"       then AEC::InstanceType::Hpc7a48xlarge
      when "hpc7a.96xlarge"       then AEC::InstanceType::Hpc7a96xlarge
      when "c7gd.medium"          then AEC::InstanceType::C7gdMedium
      when "c7gd.large"           then AEC::InstanceType::C7gdLarge
      when "c7gd.xlarge"          then AEC::InstanceType::C7gdXlarge
      when "c7gd.2xlarge"         then AEC::InstanceType::C7gd2xlarge
      when "c7gd.4xlarge"         then AEC::InstanceType::C7gd4xlarge
      when "c7gd.8xlarge"         then AEC::InstanceType::C7gd8xlarge
      when "c7gd.12xlarge"        then AEC::InstanceType::C7gd12xlarge
      when "c7gd.16xlarge"        then AEC::InstanceType::C7gd16xlarge
      when "m7gd.medium"          then AEC::InstanceType::M7gdMedium
      when "m7gd.large"           then AEC::InstanceType::M7gdLarge
      when "m7gd.xlarge"          then AEC::InstanceType::M7gdXlarge
      when "m7gd.2xlarge"         then AEC::InstanceType::M7gd2xlarge
      when "m7gd.4xlarge"         then AEC::InstanceType::M7gd4xlarge
      when "m7gd.8xlarge"         then AEC::InstanceType::M7gd8xlarge
      when "m7gd.12xlarge"        then AEC::InstanceType::M7gd12xlarge
      when "m7gd.16xlarge"        then AEC::InstanceType::M7gd16xlarge
      when "r7gd.medium"          then AEC::InstanceType::R7gdMedium
      when "r7gd.large"           then AEC::InstanceType::R7gdLarge
      when "r7gd.xlarge"          then AEC::InstanceType::R7gdXlarge
      when "r7gd.2xlarge"         then AEC::InstanceType::R7gd2xlarge
      when "r7gd.4xlarge"         then AEC::InstanceType::R7gd4xlarge
      when "r7gd.8xlarge"         then AEC::InstanceType::R7gd8xlarge
      when "r7gd.12xlarge"        then AEC::InstanceType::R7gd12xlarge
      when "r7gd.16xlarge"        then AEC::InstanceType::R7gd16xlarge
      when "r7a.medium"           then AEC::InstanceType::R7aMedium
      when "r7a.large"            then AEC::InstanceType::R7aLarge
      when "r7a.xlarge"           then AEC::InstanceType::R7aXlarge
      when "r7a.2xlarge"          then AEC::InstanceType::R7a2xlarge
      when "r7a.4xlarge"          then AEC::InstanceType::R7a4xlarge
      when "r7a.8xlarge"          then AEC::InstanceType::R7a8xlarge
      when "r7a.12xlarge"         then AEC::InstanceType::R7a12xlarge
      when "r7a.16xlarge"         then AEC::InstanceType::R7a16xlarge
      when "r7a.24xlarge"         then AEC::InstanceType::R7a24xlarge
      when "r7a.32xlarge"         then AEC::InstanceType::R7a32xlarge
      when "r7a.48xlarge"         then AEC::InstanceType::R7a48xlarge
      when "c7i.large"            then AEC::InstanceType::C7iLarge
      when "c7i.xlarge"           then AEC::InstanceType::C7iXlarge
      when "c7i.2xlarge"          then AEC::InstanceType::C7i2xlarge
      when "c7i.4xlarge"          then AEC::InstanceType::C7i4xlarge
      when "c7i.8xlarge"          then AEC::InstanceType::C7i8xlarge
      when "c7i.12xlarge"         then AEC::InstanceType::C7i12xlarge
      when "c7i.16xlarge"         then AEC::InstanceType::C7i16xlarge
      when "c7i.24xlarge"         then AEC::InstanceType::C7i24xlarge
      when "c7i.48xlarge"         then AEC::InstanceType::C7i48xlarge
      when "mac2-m2pro.metal"     then AEC::InstanceType::Mac2M2proMetal
      when "r7iz.large"           then AEC::InstanceType::R7izLarge
      when "r7iz.xlarge"          then AEC::InstanceType::R7izXlarge
      when "r7iz.2xlarge"         then AEC::InstanceType::R7iz2xlarge
      when "r7iz.4xlarge"         then AEC::InstanceType::R7iz4xlarge
      when "r7iz.8xlarge"         then AEC::InstanceType::R7iz8xlarge
      when "r7iz.12xlarge"        then AEC::InstanceType::R7iz12xlarge
      when "r7iz.16xlarge"        then AEC::InstanceType::R7iz16xlarge
      when "r7iz.32xlarge"        then AEC::InstanceType::R7iz32xlarge
      when "c7a.medium"           then AEC::InstanceType::C7aMedium
      when "c7a.large"            then AEC::InstanceType::C7aLarge
      when "c7a.xlarge"           then AEC::InstanceType::C7aXlarge
      when "c7a.2xlarge"          then AEC::InstanceType::C7a2xlarge
      when "c7a.4xlarge"          then AEC::InstanceType::C7a4xlarge
      when "c7a.8xlarge"          then AEC::InstanceType::C7a8xlarge
      when "c7a.12xlarge"         then AEC::InstanceType::C7a12xlarge
      when "c7a.16xlarge"         then AEC::InstanceType::C7a16xlarge
      when "c7a.24xlarge"         then AEC::InstanceType::C7a24xlarge
      when "c7a.32xlarge"         then AEC::InstanceType::C7a32xlarge
      when "c7a.48xlarge"         then AEC::InstanceType::C7a48xlarge
      when "c7a.metal-48xl"       then AEC::InstanceType::C7aMetal48xl
      when "r7a.metal-48xl"       then AEC::InstanceType::R7aMetal48xl
      when "r7i.large"            then AEC::InstanceType::R7iLarge
      when "r7i.xlarge"           then AEC::InstanceType::R7iXlarge
      when "r7i.2xlarge"          then AEC::InstanceType::R7i2xlarge
      when "r7i.4xlarge"          then AEC::InstanceType::R7i4xlarge
      when "r7i.8xlarge"          then AEC::InstanceType::R7i8xlarge
      when "r7i.12xlarge"         then AEC::InstanceType::R7i12xlarge
      when "r7i.16xlarge"         then AEC::InstanceType::R7i16xlarge
      when "r7i.24xlarge"         then AEC::InstanceType::R7i24xlarge
      when "r7i.48xlarge"         then AEC::InstanceType::R7i48xlarge
      when "dl2q.24xlarge"        then AEC::InstanceType::Dl2q24xlarge
      when "mac2-m2.metal"        then AEC::InstanceType::Mac2M2Metal
      when "i4i.12xlarge"         then AEC::InstanceType::I4i12xlarge
      when "i4i.24xlarge"         then AEC::InstanceType::I4i24xlarge
      when "c7i.metal-24xl"       then AEC::InstanceType::C7iMetal24xl
      when "c7i.metal-48xl"       then AEC::InstanceType::C7iMetal48xl
      when "m7i.metal-24xl"       then AEC::InstanceType::M7iMetal24xl
      when "m7i.metal-48xl"       then AEC::InstanceType::M7iMetal48xl
      when "r7i.metal-24xl"       then AEC::InstanceType::R7iMetal24xl
      when "r7i.metal-48xl"       then AEC::InstanceType::R7iMetal48xl
      when "r7iz.metal-16xl"      then AEC::InstanceType::R7izMetal16xl
      when "r7iz.metal-32xl"      then AEC::InstanceType::R7izMetal32xl
      when "c7gd.metal"           then AEC::InstanceType::C7gdMetal
      when "m7gd.metal"           then AEC::InstanceType::M7gdMetal
      when "r7gd.metal"           then AEC::InstanceType::R7gdMetal
      when "g6.xlarge"            then AEC::InstanceType::G6Xlarge
      when "g6.2xlarge"           then AEC::InstanceType::G62xlarge
      when "g6.4xlarge"           then AEC::InstanceType::G64xlarge
      when "g6.8xlarge"           then AEC::InstanceType::G68xlarge
      when "g6.12xlarge"          then AEC::InstanceType::G612xlarge
      when "g6.16xlarge"          then AEC::InstanceType::G616xlarge
      when "g6.24xlarge"          then AEC::InstanceType::G624xlarge
      when "g6.48xlarge"          then AEC::InstanceType::G648xlarge
      when "gr6.4xlarge"          then AEC::InstanceType::Gr64xlarge
      when "gr6.8xlarge"          then AEC::InstanceType::Gr68xlarge
      when "c7i-flex.large"       then AEC::InstanceType::C7iFlexLarge
      when "c7i-flex.xlarge"      then AEC::InstanceType::C7iFlexXlarge
      when "c7i-flex.2xlarge"     then AEC::InstanceType::C7iFlex2xlarge
      when "c7i-flex.4xlarge"     then AEC::InstanceType::C7iFlex4xlarge
      when "c7i-flex.8xlarge"     then AEC::InstanceType::C7iFlex8xlarge
      when "u7i-12tb.224xlarge"   then AEC::InstanceType::U7i12tb224xlarge
      when "u7in-16tb.224xlarge"  then AEC::InstanceType::U7in16tb224xlarge
      when "u7in-24tb.224xlarge"  then AEC::InstanceType::U7in24tb224xlarge
      when "u7in-32tb.224xlarge"  then AEC::InstanceType::U7in32tb224xlarge
      when "u7ib-12tb.224xlarge"  then AEC::InstanceType::U7ib12tb224xlarge
      when "c7gn.metal"           then AEC::InstanceType::C7gnMetal
      when "r8g.medium"           then AEC::InstanceType::R8gMedium
      when "r8g.large"            then AEC::InstanceType::R8gLarge
      when "r8g.xlarge"           then AEC::InstanceType::R8gXlarge
      when "r8g.2xlarge"          then AEC::InstanceType::R8g2xlarge
      when "r8g.4xlarge"          then AEC::InstanceType::R8g4xlarge
      when "r8g.8xlarge"          then AEC::InstanceType::R8g8xlarge
      when "r8g.12xlarge"         then AEC::InstanceType::R8g12xlarge
      when "r8g.16xlarge"         then AEC::InstanceType::R8g16xlarge
      when "r8g.24xlarge"         then AEC::InstanceType::R8g24xlarge
      when "r8g.48xlarge"         then AEC::InstanceType::R8g48xlarge
      when "r8g.metal-24xl"       then AEC::InstanceType::R8gMetal24xl
      when "r8g.metal-48xl"       then AEC::InstanceType::R8gMetal48xl
      when "mac2-m1ultra.metal"   then AEC::InstanceType::Mac2M1ultraMetal
      when "g6e.xlarge"           then AEC::InstanceType::G6eXlarge
      when "g6e.2xlarge"          then AEC::InstanceType::G6e2xlarge
      when "g6e.4xlarge"          then AEC::InstanceType::G6e4xlarge
      when "g6e.8xlarge"          then AEC::InstanceType::G6e8xlarge
      when "g6e.12xlarge"         then AEC::InstanceType::G6e12xlarge
      when "g6e.16xlarge"         then AEC::InstanceType::G6e16xlarge
      when "g6e.24xlarge"         then AEC::InstanceType::G6e24xlarge
      when "g6e.48xlarge"         then AEC::InstanceType::G6e48xlarge
      when "c8g.medium"           then AEC::InstanceType::C8gMedium
      when "c8g.large"            then AEC::InstanceType::C8gLarge
      when "c8g.xlarge"           then AEC::InstanceType::C8gXlarge
      when "c8g.2xlarge"          then AEC::InstanceType::C8g2xlarge
      when "c8g.4xlarge"          then AEC::InstanceType::C8g4xlarge
      when "c8g.8xlarge"          then AEC::InstanceType::C8g8xlarge
      when "c8g.12xlarge"         then AEC::InstanceType::C8g12xlarge
      when "c8g.16xlarge"         then AEC::InstanceType::C8g16xlarge
      when "c8g.24xlarge"         then AEC::InstanceType::C8g24xlarge
      when "c8g.48xlarge"         then AEC::InstanceType::C8g48xlarge
      when "c8g.metal-24xl"       then AEC::InstanceType::C8gMetal24xl
      when "c8g.metal-48xl"       then AEC::InstanceType::C8gMetal48xl
      when "m8g.medium"           then AEC::InstanceType::M8gMedium
      when "m8g.large"            then AEC::InstanceType::M8gLarge
      when "m8g.xlarge"           then AEC::InstanceType::M8gXlarge
      when "m8g.2xlarge"          then AEC::InstanceType::M8g2xlarge
      when "m8g.4xlarge"          then AEC::InstanceType::M8g4xlarge
      when "m8g.8xlarge"          then AEC::InstanceType::M8g8xlarge
      when "m8g.12xlarge"         then AEC::InstanceType::M8g12xlarge
      when "m8g.16xlarge"         then AEC::InstanceType::M8g16xlarge
      when "m8g.24xlarge"         then AEC::InstanceType::M8g24xlarge
      when "m8g.48xlarge"         then AEC::InstanceType::M8g48xlarge
      when "m8g.metal-24xl"       then AEC::InstanceType::M8gMetal24xl
      when "m8g.metal-48xl"       then AEC::InstanceType::M8gMetal48xl
      when "x8g.medium"           then AEC::InstanceType::X8gMedium
      when "x8g.large"            then AEC::InstanceType::X8gLarge
      when "x8g.xlarge"           then AEC::InstanceType::X8gXlarge
      when "x8g.2xlarge"          then AEC::InstanceType::X8g2xlarge
      when "x8g.4xlarge"          then AEC::InstanceType::X8g4xlarge
      when "x8g.8xlarge"          then AEC::InstanceType::X8g8xlarge
      when "x8g.12xlarge"         then AEC::InstanceType::X8g12xlarge
      when "x8g.16xlarge"         then AEC::InstanceType::X8g16xlarge
      when "x8g.24xlarge"         then AEC::InstanceType::X8g24xlarge
      when "x8g.48xlarge"         then AEC::InstanceType::X8g48xlarge
      when "x8g.metal-24xl"       then AEC::InstanceType::X8gMetal24xl
      when "x8g.metal-48xl"       then AEC::InstanceType::X8gMetal48xl
      when "i7ie.large"           then AEC::InstanceType::I7ieLarge
      when "i7ie.xlarge"          then AEC::InstanceType::I7ieXlarge
      when "i7ie.2xlarge"         then AEC::InstanceType::I7ie2xlarge
      when "i7ie.3xlarge"         then AEC::InstanceType::I7ie3xlarge
      when "i7ie.6xlarge"         then AEC::InstanceType::I7ie6xlarge
      when "i7ie.12xlarge"        then AEC::InstanceType::I7ie12xlarge
      when "i7ie.18xlarge"        then AEC::InstanceType::I7ie18xlarge
      when "i7ie.24xlarge"        then AEC::InstanceType::I7ie24xlarge
      when "i7ie.48xlarge"        then AEC::InstanceType::I7ie48xlarge
      when "i8g.large"            then AEC::InstanceType::I8gLarge
      when "i8g.xlarge"           then AEC::InstanceType::I8gXlarge
      when "i8g.2xlarge"          then AEC::InstanceType::I8g2xlarge
      when "i8g.4xlarge"          then AEC::InstanceType::I8g4xlarge
      when "i8g.8xlarge"          then AEC::InstanceType::I8g8xlarge
      when "i8g.12xlarge"         then AEC::InstanceType::I8g12xlarge
      when "i8g.16xlarge"         then AEC::InstanceType::I8g16xlarge
      when "i8g.24xlarge"         then AEC::InstanceType::I8g24xlarge
      when "i8g.metal-24xl"       then AEC::InstanceType::I8gMetal24xl
      when "u7i-6tb.112xlarge"    then AEC::InstanceType::U7i6tb112xlarge
      when "u7i-8tb.112xlarge"    then AEC::InstanceType::U7i8tb112xlarge
      when "u7inh-32tb.480xlarge" then AEC::InstanceType::U7inh32tb480xlarge
      when "p5e.48xlarge"         then AEC::InstanceType::P5e48xlarge
      when "p5en.48xlarge"        then AEC::InstanceType::P5en48xlarge
      when "f2.12xlarge"          then AEC::InstanceType::F212xlarge
      when "f2.48xlarge"          then AEC::InstanceType::F248xlarge
      when "trn2.48xlarge"        then AEC::InstanceType::Trn248xlarge
      when "c7i-flex.12xlarge"    then AEC::InstanceType::C7iFlex12xlarge
      when "c7i-flex.16xlarge"    then AEC::InstanceType::C7iFlex16xlarge
      when "m7i-flex.12xlarge"    then AEC::InstanceType::M7iFlex12xlarge
      when "m7i-flex.16xlarge"    then AEC::InstanceType::M7iFlex16xlarge
      when "i7ie.metal-24xl"      then AEC::InstanceType::I7ieMetal24xl
      when "i7ie.metal-48xl"      then AEC::InstanceType::I7ieMetal48xl
      when "i8g.48xlarge"         then AEC::InstanceType::I8g48xlarge
      when "c8gd.medium"          then AEC::InstanceType::C8gdMedium
      when "c8gd.large"           then AEC::InstanceType::C8gdLarge
      when "c8gd.xlarge"          then AEC::InstanceType::C8gdXlarge
      when "c8gd.2xlarge"         then AEC::InstanceType::C8gd2xlarge
      when "c8gd.4xlarge"         then AEC::InstanceType::C8gd4xlarge
      when "c8gd.8xlarge"         then AEC::InstanceType::C8gd8xlarge
      when "c8gd.12xlarge"        then AEC::InstanceType::C8gd12xlarge
      when "c8gd.16xlarge"        then AEC::InstanceType::C8gd16xlarge
      when "c8gd.24xlarge"        then AEC::InstanceType::C8gd24xlarge
      when "c8gd.48xlarge"        then AEC::InstanceType::C8gd48xlarge
      when "c8gd.metal-24xl"      then AEC::InstanceType::C8gdMetal24xl
      when "c8gd.metal-48xl"      then AEC::InstanceType::C8gdMetal48xl
      when "i7i.large"            then AEC::InstanceType::I7iLarge
      when "i7i.xlarge"           then AEC::InstanceType::I7iXlarge
      when "i7i.2xlarge"          then AEC::InstanceType::I7i2xlarge
      when "i7i.4xlarge"          then AEC::InstanceType::I7i4xlarge
      when "i7i.8xlarge"          then AEC::InstanceType::I7i8xlarge
      when "i7i.12xlarge"         then AEC::InstanceType::I7i12xlarge
      when "i7i.16xlarge"         then AEC::InstanceType::I7i16xlarge
      when "i7i.24xlarge"         then AEC::InstanceType::I7i24xlarge
      when "i7i.48xlarge"         then AEC::InstanceType::I7i48xlarge
      when "i7i.metal-24xl"       then AEC::InstanceType::I7iMetal24xl
      when "i7i.metal-48xl"       then AEC::InstanceType::I7iMetal48xl
      when "p6-b200.48xlarge"     then AEC::InstanceType::P6B20048xlarge
      when "m8gd.medium"          then AEC::InstanceType::M8gdMedium
      when "m8gd.large"           then AEC::InstanceType::M8gdLarge
      when "m8gd.xlarge"          then AEC::InstanceType::M8gdXlarge
      when "m8gd.2xlarge"         then AEC::InstanceType::M8gd2xlarge
      when "m8gd.4xlarge"         then AEC::InstanceType::M8gd4xlarge
      when "m8gd.8xlarge"         then AEC::InstanceType::M8gd8xlarge
      when "m8gd.12xlarge"        then AEC::InstanceType::M8gd12xlarge
      when "m8gd.16xlarge"        then AEC::InstanceType::M8gd16xlarge
      when "m8gd.24xlarge"        then AEC::InstanceType::M8gd24xlarge
      when "m8gd.48xlarge"        then AEC::InstanceType::M8gd48xlarge
      when "m8gd.metal-24xl"      then AEC::InstanceType::M8gdMetal24xl
      when "m8gd.metal-48xl"      then AEC::InstanceType::M8gdMetal48xl
      when "r8gd.medium"          then AEC::InstanceType::R8gdMedium
      when "r8gd.large"           then AEC::InstanceType::R8gdLarge
      when "r8gd.xlarge"          then AEC::InstanceType::R8gdXlarge
      when "r8gd.2xlarge"         then AEC::InstanceType::R8gd2xlarge
      when "r8gd.4xlarge"         then AEC::InstanceType::R8gd4xlarge
      when "r8gd.8xlarge"         then AEC::InstanceType::R8gd8xlarge
      when "r8gd.12xlarge"        then AEC::InstanceType::R8gd12xlarge
      when "r8gd.16xlarge"        then AEC::InstanceType::R8gd16xlarge
      when "r8gd.24xlarge"        then AEC::InstanceType::R8gd24xlarge
      when "r8gd.48xlarge"        then AEC::InstanceType::R8gd48xlarge
      when "r8gd.metal-24xl"      then AEC::InstanceType::R8gdMetal24xl
      when "r8gd.metal-48xl"      then AEC::InstanceType::R8gdMetal48xl
      when "c8gn.medium"          then AEC::InstanceType::C8gnMedium
      when "c8gn.large"           then AEC::InstanceType::C8gnLarge
      when "c8gn.xlarge"          then AEC::InstanceType::C8gnXlarge
      when "c8gn.2xlarge"         then AEC::InstanceType::C8gn2xlarge
      when "c8gn.4xlarge"         then AEC::InstanceType::C8gn4xlarge
      when "c8gn.8xlarge"         then AEC::InstanceType::C8gn8xlarge
      when "c8gn.12xlarge"        then AEC::InstanceType::C8gn12xlarge
      when "c8gn.16xlarge"        then AEC::InstanceType::C8gn16xlarge
      when "c8gn.24xlarge"        then AEC::InstanceType::C8gn24xlarge
      when "c8gn.48xlarge"        then AEC::InstanceType::C8gn48xlarge
      when "c8gn.metal-24xl"      then AEC::InstanceType::C8gnMetal24xl
      when "c8gn.metal-48xl"      then AEC::InstanceType::C8gnMetal48xl
      when "f2.6xlarge"           then AEC::InstanceType::F26xlarge
      when "p6e-gb200.36xlarge"   then AEC::InstanceType::P6eGb20036xlarge
      when "g6f.large"            then AEC::InstanceType::G6fLarge
      when "g6f.xlarge"           then AEC::InstanceType::G6fXlarge
      when "g6f.2xlarge"          then AEC::InstanceType::G6f2xlarge
      when "g6f.4xlarge"          then AEC::InstanceType::G6f4xlarge
      when "gr6f.4xlarge"         then AEC::InstanceType::Gr6f4xlarge
      when "p5.4xlarge"           then AEC::InstanceType::P54xlarge
      when "r8i.large"            then AEC::InstanceType::R8iLarge
      when "r8i.xlarge"           then AEC::InstanceType::R8iXlarge
      when "r8i.2xlarge"          then AEC::InstanceType::R8i2xlarge
      when "r8i.4xlarge"          then AEC::InstanceType::R8i4xlarge
      when "r8i.8xlarge"          then AEC::InstanceType::R8i8xlarge
      when "r8i.12xlarge"         then AEC::InstanceType::R8i12xlarge
      when "r8i.16xlarge"         then AEC::InstanceType::R8i16xlarge
      when "r8i.24xlarge"         then AEC::InstanceType::R8i24xlarge
      when "r8i.32xlarge"         then AEC::InstanceType::R8i32xlarge
      when "r8i.48xlarge"         then AEC::InstanceType::R8i48xlarge
      when "r8i.96xlarge"         then AEC::InstanceType::R8i96xlarge
      when "r8i.metal-48xl"       then AEC::InstanceType::R8iMetal48xl
      when "r8i.metal-96xl"       then AEC::InstanceType::R8iMetal96xl
      when "r8i-flex.large"       then AEC::InstanceType::R8iFlexLarge
      when "r8i-flex.xlarge"      then AEC::InstanceType::R8iFlexXlarge
      when "r8i-flex.2xlarge"     then AEC::InstanceType::R8iFlex2xlarge
      when "r8i-flex.4xlarge"     then AEC::InstanceType::R8iFlex4xlarge
      when "r8i-flex.8xlarge"     then AEC::InstanceType::R8iFlex8xlarge
      when "r8i-flex.12xlarge"    then AEC::InstanceType::R8iFlex12xlarge
      when "r8i-flex.16xlarge"    then AEC::InstanceType::R8iFlex16xlarge
      when "m8i.large"            then AEC::InstanceType::M8iLarge
      when "m8i.xlarge"           then AEC::InstanceType::M8iXlarge
      when "m8i.2xlarge"          then AEC::InstanceType::M8i2xlarge
      when "m8i.4xlarge"          then AEC::InstanceType::M8i4xlarge
      when "m8i.8xlarge"          then AEC::InstanceType::M8i8xlarge
      when "m8i.12xlarge"         then AEC::InstanceType::M8i12xlarge
      when "m8i.16xlarge"         then AEC::InstanceType::M8i16xlarge
      when "m8i.24xlarge"         then AEC::InstanceType::M8i24xlarge
      when "m8i.32xlarge"         then AEC::InstanceType::M8i32xlarge
      when "m8i.48xlarge"         then AEC::InstanceType::M8i48xlarge
      when "m8i.96xlarge"         then AEC::InstanceType::M8i96xlarge
      when "m8i.metal-48xl"       then AEC::InstanceType::M8iMetal48xl
      when "m8i.metal-96xl"       then AEC::InstanceType::M8iMetal96xl
      when "m8i-flex.large"       then AEC::InstanceType::M8iFlexLarge
      when "m8i-flex.xlarge"      then AEC::InstanceType::M8iFlexXlarge
      when "m8i-flex.2xlarge"     then AEC::InstanceType::M8iFlex2xlarge
      when "m8i-flex.4xlarge"     then AEC::InstanceType::M8iFlex4xlarge
      when "m8i-flex.8xlarge"     then AEC::InstanceType::M8iFlex8xlarge
      when "m8i-flex.12xlarge"    then AEC::InstanceType::M8iFlex12xlarge
      when "m8i-flex.16xlarge"    then AEC::InstanceType::M8iFlex16xlarge
      when "i8ge.large"           then AEC::InstanceType::I8geLarge
      when "i8ge.xlarge"          then AEC::InstanceType::I8geXlarge
      when "i8ge.2xlarge"         then AEC::InstanceType::I8ge2xlarge
      when "i8ge.3xlarge"         then AEC::InstanceType::I8ge3xlarge
      when "i8ge.6xlarge"         then AEC::InstanceType::I8ge6xlarge
      when "i8ge.12xlarge"        then AEC::InstanceType::I8ge12xlarge
      when "i8ge.18xlarge"        then AEC::InstanceType::I8ge18xlarge
      when "i8ge.24xlarge"        then AEC::InstanceType::I8ge24xlarge
      when "i8ge.48xlarge"        then AEC::InstanceType::I8ge48xlarge
      when "i8ge.metal-24xl"      then AEC::InstanceType::I8geMetal24xl
      when "i8ge.metal-48xl"      then AEC::InstanceType::I8geMetal48xl
      when "mac-m4.metal"         then AEC::InstanceType::MacM4Metal
      when "mac-m4pro.metal"      then AEC::InstanceType::MacM4proMetal
      when "r8gn.medium"          then AEC::InstanceType::R8gnMedium
      when "r8gn.large"           then AEC::InstanceType::R8gnLarge
      when "r8gn.xlarge"          then AEC::InstanceType::R8gnXlarge
      when "r8gn.2xlarge"         then AEC::InstanceType::R8gn2xlarge
      when "r8gn.4xlarge"         then AEC::InstanceType::R8gn4xlarge
      when "r8gn.8xlarge"         then AEC::InstanceType::R8gn8xlarge
      when "r8gn.12xlarge"        then AEC::InstanceType::R8gn12xlarge
      when "r8gn.16xlarge"        then AEC::InstanceType::R8gn16xlarge
      when "r8gn.24xlarge"        then AEC::InstanceType::R8gn24xlarge
      when "r8gn.48xlarge"        then AEC::InstanceType::R8gn48xlarge
      when "r8gn.metal-24xl"      then AEC::InstanceType::R8gnMetal24xl
      when "r8gn.metal-48xl"      then AEC::InstanceType::R8gnMetal48xl
      when "c8i.large"            then AEC::InstanceType::C8iLarge
      when "c8i.xlarge"           then AEC::InstanceType::C8iXlarge
      when "c8i.2xlarge"          then AEC::InstanceType::C8i2xlarge
      when "c8i.4xlarge"          then AEC::InstanceType::C8i4xlarge
      when "c8i.8xlarge"          then AEC::InstanceType::C8i8xlarge
      when "c8i.12xlarge"         then AEC::InstanceType::C8i12xlarge
      when "c8i.16xlarge"         then AEC::InstanceType::C8i16xlarge
      when "c8i.24xlarge"         then AEC::InstanceType::C8i24xlarge
      when "c8i.32xlarge"         then AEC::InstanceType::C8i32xlarge
      when "c8i.48xlarge"         then AEC::InstanceType::C8i48xlarge
      when "c8i.96xlarge"         then AEC::InstanceType::C8i96xlarge
      when "c8i.metal-48xl"       then AEC::InstanceType::C8iMetal48xl
      when "c8i.metal-96xl"       then AEC::InstanceType::C8iMetal96xl
      when "c8i-flex.large"       then AEC::InstanceType::C8iFlexLarge
      when "c8i-flex.xlarge"      then AEC::InstanceType::C8iFlexXlarge
      when "c8i-flex.2xlarge"     then AEC::InstanceType::C8iFlex2xlarge
      when "c8i-flex.4xlarge"     then AEC::InstanceType::C8iFlex4xlarge
      when "c8i-flex.8xlarge"     then AEC::InstanceType::C8iFlex8xlarge
      when "c8i-flex.12xlarge"    then AEC::InstanceType::C8iFlex12xlarge
      when "c8i-flex.16xlarge"    then AEC::InstanceType::C8iFlex16xlarge
      when "r8gb.medium"          then AEC::InstanceType::R8gbMedium
      when "r8gb.large"           then AEC::InstanceType::R8gbLarge
      when "r8gb.xlarge"          then AEC::InstanceType::R8gbXlarge
      when "r8gb.2xlarge"         then AEC::InstanceType::R8gb2xlarge
      when "r8gb.4xlarge"         then AEC::InstanceType::R8gb4xlarge
      when "r8gb.8xlarge"         then AEC::InstanceType::R8gb8xlarge
      when "r8gb.12xlarge"        then AEC::InstanceType::R8gb12xlarge
      when "r8gb.16xlarge"        then AEC::InstanceType::R8gb16xlarge
      when "r8gb.24xlarge"        then AEC::InstanceType::R8gb24xlarge
      when "r8gb.metal-24xl"      then AEC::InstanceType::R8gbMetal24xl
      when "m8a.medium"           then AEC::InstanceType::M8aMedium
      when "m8a.large"            then AEC::InstanceType::M8aLarge
      when "m8a.xlarge"           then AEC::InstanceType::M8aXlarge
      when "m8a.2xlarge"          then AEC::InstanceType::M8a2xlarge
      when "m8a.4xlarge"          then AEC::InstanceType::M8a4xlarge
      when "m8a.8xlarge"          then AEC::InstanceType::M8a8xlarge
      when "m8a.12xlarge"         then AEC::InstanceType::M8a12xlarge
      when "m8a.16xlarge"         then AEC::InstanceType::M8a16xlarge
      when "m8a.24xlarge"         then AEC::InstanceType::M8a24xlarge
      when "m8a.48xlarge"         then AEC::InstanceType::M8a48xlarge
      when "m8a.metal-24xl"       then AEC::InstanceType::M8aMetal24xl
      when "m8a.metal-48xl"       then AEC::InstanceType::M8aMetal48xl
      when "trn2.3xlarge"         then AEC::InstanceType::Trn23xlarge
      when "r8a.medium"           then AEC::InstanceType::R8aMedium
      when "r8a.large"            then AEC::InstanceType::R8aLarge
      when "r8a.xlarge"           then AEC::InstanceType::R8aXlarge
      when "r8a.2xlarge"          then AEC::InstanceType::R8a2xlarge
      when "r8a.4xlarge"          then AEC::InstanceType::R8a4xlarge
      when "r8a.8xlarge"          then AEC::InstanceType::R8a8xlarge
      when "r8a.12xlarge"         then AEC::InstanceType::R8a12xlarge
      when "r8a.16xlarge"         then AEC::InstanceType::R8a16xlarge
      when "r8a.24xlarge"         then AEC::InstanceType::R8a24xlarge
      when "r8a.48xlarge"         then AEC::InstanceType::R8a48xlarge
      when "r8a.metal-24xl"       then AEC::InstanceType::R8aMetal24xl
      when "r8a.metal-48xl"       then AEC::InstanceType::R8aMetal48xl
      when "p6-b300.48xlarge"     then AEC::InstanceType::P6B30048xlarge
      when "c8a.medium"           then AEC::InstanceType::C8aMedium
      when "c8a.large"            then AEC::InstanceType::C8aLarge
      when "c8a.xlarge"           then AEC::InstanceType::C8aXlarge
      when "c8a.2xlarge"          then AEC::InstanceType::C8a2xlarge
      when "c8a.4xlarge"          then AEC::InstanceType::C8a4xlarge
      when "c8a.8xlarge"          then AEC::InstanceType::C8a8xlarge
      when "c8a.12xlarge"         then AEC::InstanceType::C8a12xlarge
      when "c8a.16xlarge"         then AEC::InstanceType::C8a16xlarge
      when "c8a.24xlarge"         then AEC::InstanceType::C8a24xlarge
      when "c8a.48xlarge"         then AEC::InstanceType::C8a48xlarge
      when "c8a.metal-24xl"       then AEC::InstanceType::C8aMetal24xl
      when "c8a.metal-48xl"       then AEC::InstanceType::C8aMetal48xl
      when "c8gb.12xlarge"        then AEC::InstanceType::C8gb12xlarge
      when "c8gb.16xlarge"        then AEC::InstanceType::C8gb16xlarge
      when "c8gb.24xlarge"        then AEC::InstanceType::C8gb24xlarge
      when "c8gb.2xlarge"         then AEC::InstanceType::C8gb2xlarge
      when "c8gb.4xlarge"         then AEC::InstanceType::C8gb4xlarge
      when "c8gb.8xlarge"         then AEC::InstanceType::C8gb8xlarge
      when "c8gb.large"           then AEC::InstanceType::C8gbLarge
      when "c8gb.medium"          then AEC::InstanceType::C8gbMedium
      when "c8gb.metal-24xl"      then AEC::InstanceType::C8gbMetal24xl
      when "c8gb.xlarge"          then AEC::InstanceType::C8gbXlarge
      when "c8gb.48xlarge"        then AEC::InstanceType::C8gb48xlarge
      when "c8gb.metal-48xl"      then AEC::InstanceType::C8gbMetal48xl
      when "m8gb.12xlarge"        then AEC::InstanceType::M8gb12xlarge
      when "m8gb.16xlarge"        then AEC::InstanceType::M8gb16xlarge
      when "m8gb.24xlarge"        then AEC::InstanceType::M8gb24xlarge
      when "m8gb.2xlarge"         then AEC::InstanceType::M8gb2xlarge
      when "m8gb.4xlarge"         then AEC::InstanceType::M8gb4xlarge
      when "m8gb.8xlarge"         then AEC::InstanceType::M8gb8xlarge
      when "m8gb.large"           then AEC::InstanceType::M8gbLarge
      when "m8gb.medium"          then AEC::InstanceType::M8gbMedium
      when "m8gb.xlarge"          then AEC::InstanceType::M8gbXlarge
      when "m8gb.48xlarge"        then AEC::InstanceType::M8gb48xlarge
      when "m8gb.metal-24xl"      then AEC::InstanceType::M8gbMetal24xl
      when "m8gb.metal-48xl"      then AEC::InstanceType::M8gbMetal48xl
      when "m8gn.12xlarge"        then AEC::InstanceType::M8gn12xlarge
      when "m8gn.16xlarge"        then AEC::InstanceType::M8gn16xlarge
      when "m8gn.24xlarge"        then AEC::InstanceType::M8gn24xlarge
      when "m8gn.2xlarge"         then AEC::InstanceType::M8gn2xlarge
      when "m8gn.48xlarge"        then AEC::InstanceType::M8gn48xlarge
      when "m8gn.4xlarge"         then AEC::InstanceType::M8gn4xlarge
      when "m8gn.8xlarge"         then AEC::InstanceType::M8gn8xlarge
      when "m8gn.large"           then AEC::InstanceType::M8gnLarge
      when "m8gn.medium"          then AEC::InstanceType::M8gnMedium
      when "m8gn.xlarge"          then AEC::InstanceType::M8gnXlarge
      when "m8gn.metal-24xl"      then AEC::InstanceType::M8gnMetal24xl
      when "m8gn.metal-48xl"      then AEC::InstanceType::M8gnMetal48xl
      when "x8aedz.12xlarge"      then AEC::InstanceType::X8aedz12xlarge
      when "x8aedz.24xlarge"      then AEC::InstanceType::X8aedz24xlarge
      when "x8aedz.3xlarge"       then AEC::InstanceType::X8aedz3xlarge
      when "x8aedz.6xlarge"       then AEC::InstanceType::X8aedz6xlarge
      when "x8aedz.large"         then AEC::InstanceType::X8aedzLarge
      when "x8aedz.metal-12xl"    then AEC::InstanceType::X8aedzMetal12xl
      when "x8aedz.metal-24xl"    then AEC::InstanceType::X8aedzMetal24xl
      when "x8aedz.xlarge"        then AEC::InstanceType::X8aedzXlarge
      when "m8azn.medium"         then AEC::InstanceType::M8aznMedium
      when "m8azn.large"          then AEC::InstanceType::M8aznLarge
      when "m8azn.xlarge"         then AEC::InstanceType::M8aznXlarge
      when "m8azn.3xlarge"        then AEC::InstanceType::M8azn3xlarge
      when "m8azn.6xlarge"        then AEC::InstanceType::M8azn6xlarge
      when "m8azn.12xlarge"       then AEC::InstanceType::M8azn12xlarge
      when "m8azn.24xlarge"       then AEC::InstanceType::M8azn24xlarge
      when "m8azn.metal-12xl"     then AEC::InstanceType::M8aznMetal12xl
      when "m8azn.metal-24xl"     then AEC::InstanceType::M8aznMetal24xl
      when "x8i.large"            then AEC::InstanceType::X8iLarge
      when "x8i.xlarge"           then AEC::InstanceType::X8iXlarge
      when "x8i.2xlarge"          then AEC::InstanceType::X8i2xlarge
      when "x8i.4xlarge"          then AEC::InstanceType::X8i4xlarge
      when "x8i.8xlarge"          then AEC::InstanceType::X8i8xlarge
      when "x8i.12xlarge"         then AEC::InstanceType::X8i12xlarge
      when "x8i.16xlarge"         then AEC::InstanceType::X8i16xlarge
      when "x8i.24xlarge"         then AEC::InstanceType::X8i24xlarge
      when "x8i.32xlarge"         then AEC::InstanceType::X8i32xlarge
      when "x8i.48xlarge"         then AEC::InstanceType::X8i48xlarge
      when "x8i.64xlarge"         then AEC::InstanceType::X8i64xlarge
      when "x8i.96xlarge"         then AEC::InstanceType::X8i96xlarge
      when "x8i.metal-48xl"       then AEC::InstanceType::X8iMetal48xl
      when "x8i.metal-96xl"       then AEC::InstanceType::X8iMetal96xl
      when "mac-m4max.metal"      then AEC::InstanceType::MacM4maxMetal
      when "g7e.2xlarge"          then AEC::InstanceType::G7e2xlarge
      when "g7e.4xlarge"          then AEC::InstanceType::G7e4xlarge
      when "g7e.8xlarge"          then AEC::InstanceType::G7e8xlarge
      when "g7e.12xlarge"         then AEC::InstanceType::G7e12xlarge
      when "g7e.24xlarge"         then AEC::InstanceType::G7e24xlarge
      when "g7e.48xlarge"         then AEC::InstanceType::G7e48xlarge
      when "r8id.large"           then AEC::InstanceType::R8idLarge
      when "r8id.xlarge"          then AEC::InstanceType::R8idXlarge
      when "r8id.2xlarge"         then AEC::InstanceType::R8id2xlarge
      when "r8id.4xlarge"         then AEC::InstanceType::R8id4xlarge
      when "r8id.8xlarge"         then AEC::InstanceType::R8id8xlarge
      when "r8id.12xlarge"        then AEC::InstanceType::R8id12xlarge
      when "r8id.16xlarge"        then AEC::InstanceType::R8id16xlarge
      when "r8id.24xlarge"        then AEC::InstanceType::R8id24xlarge
      when "r8id.32xlarge"        then AEC::InstanceType::R8id32xlarge
      when "r8id.48xlarge"        then AEC::InstanceType::R8id48xlarge
      when "r8id.96xlarge"        then AEC::InstanceType::R8id96xlarge
      when "r8id.metal-48xl"      then AEC::InstanceType::R8idMetal48xl
      when "r8id.metal-96xl"      then AEC::InstanceType::R8idMetal96xl
      when "c8id.large"           then AEC::InstanceType::C8idLarge
      when "c8id.xlarge"          then AEC::InstanceType::C8idXlarge
      when "c8id.2xlarge"         then AEC::InstanceType::C8id2xlarge
      when "c8id.4xlarge"         then AEC::InstanceType::C8id4xlarge
      when "c8id.8xlarge"         then AEC::InstanceType::C8id8xlarge
      when "c8id.12xlarge"        then AEC::InstanceType::C8id12xlarge
      when "c8id.16xlarge"        then AEC::InstanceType::C8id16xlarge
      when "c8id.24xlarge"        then AEC::InstanceType::C8id24xlarge
      when "c8id.32xlarge"        then AEC::InstanceType::C8id32xlarge
      when "c8id.48xlarge"        then AEC::InstanceType::C8id48xlarge
      when "c8id.96xlarge"        then AEC::InstanceType::C8id96xlarge
      when "c8id.metal-48xl"      then AEC::InstanceType::C8idMetal48xl
      when "c8id.metal-96xl"      then AEC::InstanceType::C8idMetal96xl
      when "m8id.large"           then AEC::InstanceType::M8idLarge
      when "m8id.xlarge"          then AEC::InstanceType::M8idXlarge
      when "m8id.2xlarge"         then AEC::InstanceType::M8id2xlarge
      when "m8id.4xlarge"         then AEC::InstanceType::M8id4xlarge
      when "m8id.8xlarge"         then AEC::InstanceType::M8id8xlarge
      when "m8id.12xlarge"        then AEC::InstanceType::M8id12xlarge
      when "m8id.16xlarge"        then AEC::InstanceType::M8id16xlarge
      when "m8id.24xlarge"        then AEC::InstanceType::M8id24xlarge
      when "m8id.32xlarge"        then AEC::InstanceType::M8id32xlarge
      when "m8id.48xlarge"        then AEC::InstanceType::M8id48xlarge
      when "m8id.96xlarge"        then AEC::InstanceType::M8id96xlarge
      when "m8id.metal-48xl"      then AEC::InstanceType::M8idMetal48xl
      when "m8id.metal-96xl"      then AEC::InstanceType::M8idMetal96xl
      when "hpc8a.96xlarge"       then AEC::InstanceType::Hpc8a96xlarge
      when "c8in.large"           then AEC::InstanceType::C8inLarge
      when "c8in.xlarge"          then AEC::InstanceType::C8inXlarge
      when "c8in.2xlarge"         then AEC::InstanceType::C8in2xlarge
      when "c8in.4xlarge"         then AEC::InstanceType::C8in4xlarge
      when "c8in.8xlarge"         then AEC::InstanceType::C8in8xlarge
      when "c8in.12xlarge"        then AEC::InstanceType::C8in12xlarge
      when "c8in.16xlarge"        then AEC::InstanceType::C8in16xlarge
      when "c8in.24xlarge"        then AEC::InstanceType::C8in24xlarge
      when "c8in.32xlarge"        then AEC::InstanceType::C8in32xlarge
      when "c8in.48xlarge"        then AEC::InstanceType::C8in48xlarge
      when "c8in.96xlarge"        then AEC::InstanceType::C8in96xlarge
      when "c8in.metal-48xl"      then AEC::InstanceType::C8inMetal48xl
      when "c8in.metal-96xl"      then AEC::InstanceType::C8inMetal96xl
      when "c8ib.large"           then AEC::InstanceType::C8ibLarge
      when "c8ib.xlarge"          then AEC::InstanceType::C8ibXlarge
      when "c8ib.2xlarge"         then AEC::InstanceType::C8ib2xlarge
      when "c8ib.4xlarge"         then AEC::InstanceType::C8ib4xlarge
      when "c8ib.8xlarge"         then AEC::InstanceType::C8ib8xlarge
      when "c8ib.12xlarge"        then AEC::InstanceType::C8ib12xlarge
      when "c8ib.16xlarge"        then AEC::InstanceType::C8ib16xlarge
      when "c8ib.24xlarge"        then AEC::InstanceType::C8ib24xlarge
      when "c8ib.32xlarge"        then AEC::InstanceType::C8ib32xlarge
      when "c8ib.48xlarge"        then AEC::InstanceType::C8ib48xlarge
      when "c8ib.96xlarge"        then AEC::InstanceType::C8ib96xlarge
      when "c8ib.metal-48xl"      then AEC::InstanceType::C8ibMetal48xl
      when "c8ib.metal-96xl"      then AEC::InstanceType::C8ibMetal96xl
      when "r8in.large"           then AEC::InstanceType::R8inLarge
      when "r8in.xlarge"          then AEC::InstanceType::R8inXlarge
      when "r8in.2xlarge"         then AEC::InstanceType::R8in2xlarge
      when "r8in.4xlarge"         then AEC::InstanceType::R8in4xlarge
      when "r8in.8xlarge"         then AEC::InstanceType::R8in8xlarge
      when "r8in.12xlarge"        then AEC::InstanceType::R8in12xlarge
      when "r8in.16xlarge"        then AEC::InstanceType::R8in16xlarge
      when "r8in.24xlarge"        then AEC::InstanceType::R8in24xlarge
      when "r8in.32xlarge"        then AEC::InstanceType::R8in32xlarge
      when "r8in.48xlarge"        then AEC::InstanceType::R8in48xlarge
      when "r8in.96xlarge"        then AEC::InstanceType::R8in96xlarge
      when "r8ib.large"           then AEC::InstanceType::R8ibLarge
      when "r8ib.xlarge"          then AEC::InstanceType::R8ibXlarge
      when "r8ib.2xlarge"         then AEC::InstanceType::R8ib2xlarge
      when "r8ib.4xlarge"         then AEC::InstanceType::R8ib4xlarge
      when "r8ib.8xlarge"         then AEC::InstanceType::R8ib8xlarge
      when "r8ib.12xlarge"        then AEC::InstanceType::R8ib12xlarge
      when "r8ib.16xlarge"        then AEC::InstanceType::R8ib16xlarge
      when "r8ib.24xlarge"        then AEC::InstanceType::R8ib24xlarge
      when "r8ib.32xlarge"        then AEC::InstanceType::R8ib32xlarge
      when "r8ib.48xlarge"        then AEC::InstanceType::R8ib48xlarge
      when "r8ib.96xlarge"        then AEC::InstanceType::R8ib96xlarge
      when "m8in.large"           then AEC::InstanceType::M8inLarge
      when "m8in.xlarge"          then AEC::InstanceType::M8inXlarge
      when "m8in.2xlarge"         then AEC::InstanceType::M8in2xlarge
      when "m8in.4xlarge"         then AEC::InstanceType::M8in4xlarge
      when "m8in.8xlarge"         then AEC::InstanceType::M8in8xlarge
      when "m8in.12xlarge"        then AEC::InstanceType::M8in12xlarge
      when "m8in.16xlarge"        then AEC::InstanceType::M8in16xlarge
      when "m8in.24xlarge"        then AEC::InstanceType::M8in24xlarge
      when "m8in.32xlarge"        then AEC::InstanceType::M8in32xlarge
      when "m8in.48xlarge"        then AEC::InstanceType::M8in48xlarge
      when "m8in.96xlarge"        then AEC::InstanceType::M8in96xlarge
      when "m8ib.large"           then AEC::InstanceType::M8ibLarge
      when "m8ib.xlarge"          then AEC::InstanceType::M8ibXlarge
      when "m8ib.2xlarge"         then AEC::InstanceType::M8ib2xlarge
      when "m8ib.4xlarge"         then AEC::InstanceType::M8ib4xlarge
      when "m8ib.8xlarge"         then AEC::InstanceType::M8ib8xlarge
      when "m8ib.12xlarge"        then AEC::InstanceType::M8ib12xlarge
      when "m8ib.16xlarge"        then AEC::InstanceType::M8ib16xlarge
      when "m8ib.24xlarge"        then AEC::InstanceType::M8ib24xlarge
      when "m8ib.32xlarge"        then AEC::InstanceType::M8ib32xlarge
      when "m8ib.48xlarge"        then AEC::InstanceType::M8ib48xlarge
      when "m8ib.96xlarge"        then AEC::InstanceType::M8ib96xlarge
      when "m8ine.large"          then AEC::InstanceType::M8ineLarge
      when "m8ine.xlarge"         then AEC::InstanceType::M8ineXlarge
      when "m8ine.2xlarge"        then AEC::InstanceType::M8ine2xlarge
      when "m8ine.4xlarge"        then AEC::InstanceType::M8ine4xlarge
      when "m8ine.8xlarge"        then AEC::InstanceType::M8ine8xlarge
      when "m8ine.12xlarge"       then AEC::InstanceType::M8ine12xlarge
      when "c8ine.large"          then AEC::InstanceType::C8ineLarge
      when "c8ine.xlarge"         then AEC::InstanceType::C8ineXlarge
      when "c8ine.2xlarge"        then AEC::InstanceType::C8ine2xlarge
      when "c8ine.4xlarge"        then AEC::InstanceType::C8ine4xlarge
      when "c8ine.8xlarge"        then AEC::InstanceType::C8ine8xlarge
      when "c8ine.12xlarge"       then AEC::InstanceType::C8ine12xlarge
      when "m8idn.large"          then AEC::InstanceType::M8idnLarge
      when "m8idn.xlarge"         then AEC::InstanceType::M8idnXlarge
      when "m8idn.2xlarge"        then AEC::InstanceType::M8idn2xlarge
      when "m8idn.4xlarge"        then AEC::InstanceType::M8idn4xlarge
      when "m8idn.8xlarge"        then AEC::InstanceType::M8idn8xlarge
      when "m8idn.12xlarge"       then AEC::InstanceType::M8idn12xlarge
      when "m8idn.16xlarge"       then AEC::InstanceType::M8idn16xlarge
      when "m8idn.24xlarge"       then AEC::InstanceType::M8idn24xlarge
      when "m8idn.32xlarge"       then AEC::InstanceType::M8idn32xlarge
      when "m8idn.48xlarge"       then AEC::InstanceType::M8idn48xlarge
      when "m8idn.96xlarge"       then AEC::InstanceType::M8idn96xlarge
      when "r8idn.large"          then AEC::InstanceType::R8idnLarge
      when "r8idn.xlarge"         then AEC::InstanceType::R8idnXlarge
      when "r8idn.2xlarge"        then AEC::InstanceType::R8idn2xlarge
      when "r8idn.4xlarge"        then AEC::InstanceType::R8idn4xlarge
      when "r8idn.8xlarge"        then AEC::InstanceType::R8idn8xlarge
      when "r8idn.12xlarge"       then AEC::InstanceType::R8idn12xlarge
      when "r8idn.16xlarge"       then AEC::InstanceType::R8idn16xlarge
      when "r8idn.24xlarge"       then AEC::InstanceType::R8idn24xlarge
      when "r8idn.32xlarge"       then AEC::InstanceType::R8idn32xlarge
      when "r8idn.48xlarge"       then AEC::InstanceType::R8idn48xlarge
      when "r8idn.96xlarge"       then AEC::InstanceType::R8idn96xlarge
      when "m8idb.large"          then AEC::InstanceType::M8idbLarge
      when "m8idb.xlarge"         then AEC::InstanceType::M8idbXlarge
      when "m8idb.2xlarge"        then AEC::InstanceType::M8idb2xlarge
      when "m8idb.4xlarge"        then AEC::InstanceType::M8idb4xlarge
      when "m8idb.8xlarge"        then AEC::InstanceType::M8idb8xlarge
      when "m8idb.12xlarge"       then AEC::InstanceType::M8idb12xlarge
      when "m8idb.16xlarge"       then AEC::InstanceType::M8idb16xlarge
      when "m8idb.24xlarge"       then AEC::InstanceType::M8idb24xlarge
      when "m8idb.32xlarge"       then AEC::InstanceType::M8idb32xlarge
      when "m8idb.48xlarge"       then AEC::InstanceType::M8idb48xlarge
      when "m8idb.96xlarge"       then AEC::InstanceType::M8idb96xlarge
      when "r8idb.large"          then AEC::InstanceType::R8idbLarge
      when "r8idb.xlarge"         then AEC::InstanceType::R8idbXlarge
      when "r8idb.2xlarge"        then AEC::InstanceType::R8idb2xlarge
      when "r8idb.4xlarge"        then AEC::InstanceType::R8idb4xlarge
      when "r8idb.8xlarge"        then AEC::InstanceType::R8idb8xlarge
      when "r8idb.12xlarge"       then AEC::InstanceType::R8idb12xlarge
      when "r8idb.16xlarge"       then AEC::InstanceType::R8idb16xlarge
      when "r8idb.24xlarge"       then AEC::InstanceType::R8idb24xlarge
      when "r8idb.32xlarge"       then AEC::InstanceType::R8idb32xlarge
      when "r8idb.48xlarge"       then AEC::InstanceType::R8idb48xlarge
      when "r8idb.96xlarge"       then AEC::InstanceType::R8idb96xlarge
      when "mac-m3ultra.metal"    then AEC::InstanceType::MacM3ultraMetal
      when "m9g.large"            then AEC::InstanceType::M9gLarge
      when "m9g.xlarge"           then AEC::InstanceType::M9gXlarge
      when "m9g.2xlarge"          then AEC::InstanceType::M9g2xlarge
      when "m9g.4xlarge"          then AEC::InstanceType::M9g4xlarge
      when "m9g.8xlarge"          then AEC::InstanceType::M9g8xlarge
      when "m9g.12xlarge"         then AEC::InstanceType::M9g12xlarge
      when "m9g.16xlarge"         then AEC::InstanceType::M9g16xlarge
      when "m9g.24xlarge"         then AEC::InstanceType::M9g24xlarge
      when "m9g.48xlarge"         then AEC::InstanceType::M9g48xlarge
      when "m9g.metal-24xl"       then AEC::InstanceType::M9gMetal24xl
      when "m9g.metal-48xl"       then AEC::InstanceType::M9gMetal48xl
      when "m9gd.large"           then AEC::InstanceType::M9gdLarge
      when "m9gd.xlarge"          then AEC::InstanceType::M9gdXlarge
      when "m9gd.2xlarge"         then AEC::InstanceType::M9gd2xlarge
      when "m9gd.4xlarge"         then AEC::InstanceType::M9gd4xlarge
      when "m9gd.8xlarge"         then AEC::InstanceType::M9gd8xlarge
      when "m9gd.12xlarge"        then AEC::InstanceType::M9gd12xlarge
      when "m9gd.16xlarge"        then AEC::InstanceType::M9gd16xlarge
      when "m9gd.24xlarge"        then AEC::InstanceType::M9gd24xlarge
      when "m9gd.48xlarge"        then AEC::InstanceType::M9gd48xlarge
      when "m9gd.metal-24xl"      then AEC::InstanceType::M9gdMetal24xl
      when "m9gd.metal-48xl"      then AEC::InstanceType::M9gdMetal48xl
      when "r8in.metal-48xl"      then AEC::InstanceType::R8inMetal48xl
      when "r8in.metal-96xl"      then AEC::InstanceType::R8inMetal96xl
      when "r8ib.metal-48xl"      then AEC::InstanceType::R8ibMetal48xl
      when "r8ib.metal-96xl"      then AEC::InstanceType::R8ibMetal96xl
      when "r8idn.metal-48xl"     then AEC::InstanceType::R8idnMetal48xl
      when "r8idn.metal-96xl"     then AEC::InstanceType::R8idnMetal96xl
      when "r8idb.metal-48xl"     then AEC::InstanceType::R8idbMetal48xl
      when "r8idb.metal-96xl"     then AEC::InstanceType::R8idbMetal96xl
      when "m8in.metal-48xl"      then AEC::InstanceType::M8inMetal48xl
      when "m8in.metal-96xl"      then AEC::InstanceType::M8inMetal96xl
      when "m8ib.metal-48xl"      then AEC::InstanceType::M8ibMetal48xl
      when "m8ib.metal-96xl"      then AEC::InstanceType::M8ibMetal96xl
      when "m8idn.metal-48xl"     then AEC::InstanceType::M8idnMetal48xl
      when "m8idn.metal-96xl"     then AEC::InstanceType::M8idnMetal96xl
      when "m8idb.metal-48xl"     then AEC::InstanceType::M8idbMetal48xl
      when "m8idb.metal-96xl"     then AEC::InstanceType::M8idbMetal96xl
      when "g7.2xlarge"           then AEC::InstanceType::G72xlarge
      when "g7.4xlarge"           then AEC::InstanceType::G74xlarge
      when "g7.8xlarge"           then AEC::InstanceType::G78xlarge
      when "g7.12xlarge"          then AEC::InstanceType::G712xlarge
      when "g7.24xlarge"          then AEC::InstanceType::G724xlarge
      when "g7.48xlarge"          then AEC::InstanceType::G748xlarge
      when "c9g.medium"           then AEC::InstanceType::C9gMedium
      when "c9g.large"            then AEC::InstanceType::C9gLarge
      when "c9g.xlarge"           then AEC::InstanceType::C9gXlarge
      when "c9g.2xlarge"          then AEC::InstanceType::C9g2xlarge
      when "c9g.4xlarge"          then AEC::InstanceType::C9g4xlarge
      when "c9g.8xlarge"          then AEC::InstanceType::C9g8xlarge
      when "c9g.12xlarge"         then AEC::InstanceType::C9g12xlarge
      when "c9g.16xlarge"         then AEC::InstanceType::C9g16xlarge
      when "c9g.24xlarge"         then AEC::InstanceType::C9g24xlarge
      when "c9g.48xlarge"         then AEC::InstanceType::C9g48xlarge
      when "c9g.metal-48xl"       then AEC::InstanceType::C9gMetal48xl
      when "c9gd.medium"          then AEC::InstanceType::C9gdMedium
      when "c9gd.large"           then AEC::InstanceType::C9gdLarge
      when "c9gd.xlarge"          then AEC::InstanceType::C9gdXlarge
      when "c9gd.2xlarge"         then AEC::InstanceType::C9gd2xlarge
      when "c9gd.4xlarge"         then AEC::InstanceType::C9gd4xlarge
      when "c9gd.8xlarge"         then AEC::InstanceType::C9gd8xlarge
      when "c9gd.12xlarge"        then AEC::InstanceType::C9gd12xlarge
      when "c9gd.16xlarge"        then AEC::InstanceType::C9gd16xlarge
      when "c9gd.24xlarge"        then AEC::InstanceType::C9gd24xlarge
      when "c9gd.48xlarge"        then AEC::InstanceType::C9gd48xlarge
      when "c9gd.metal-48xl"      then AEC::InstanceType::C9gdMetal48xl
      else
        raise Exception.new("unknown enum value for 'InstanceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceType::A1Medium           then "a1.medium"
      when AEC::InstanceType::A1Large            then "a1.large"
      when AEC::InstanceType::A1Xlarge           then "a1.xlarge"
      when AEC::InstanceType::A12xlarge          then "a1.2xlarge"
      when AEC::InstanceType::A14xlarge          then "a1.4xlarge"
      when AEC::InstanceType::A1Metal            then "a1.metal"
      when AEC::InstanceType::C1Medium           then "c1.medium"
      when AEC::InstanceType::C1Xlarge           then "c1.xlarge"
      when AEC::InstanceType::C3Large            then "c3.large"
      when AEC::InstanceType::C3Xlarge           then "c3.xlarge"
      when AEC::InstanceType::C32xlarge          then "c3.2xlarge"
      when AEC::InstanceType::C34xlarge          then "c3.4xlarge"
      when AEC::InstanceType::C38xlarge          then "c3.8xlarge"
      when AEC::InstanceType::C4Large            then "c4.large"
      when AEC::InstanceType::C4Xlarge           then "c4.xlarge"
      when AEC::InstanceType::C42xlarge          then "c4.2xlarge"
      when AEC::InstanceType::C44xlarge          then "c4.4xlarge"
      when AEC::InstanceType::C48xlarge          then "c4.8xlarge"
      when AEC::InstanceType::C5Large            then "c5.large"
      when AEC::InstanceType::C5Xlarge           then "c5.xlarge"
      when AEC::InstanceType::C52xlarge          then "c5.2xlarge"
      when AEC::InstanceType::C54xlarge          then "c5.4xlarge"
      when AEC::InstanceType::C59xlarge          then "c5.9xlarge"
      when AEC::InstanceType::C512xlarge         then "c5.12xlarge"
      when AEC::InstanceType::C518xlarge         then "c5.18xlarge"
      when AEC::InstanceType::C524xlarge         then "c5.24xlarge"
      when AEC::InstanceType::C5Metal            then "c5.metal"
      when AEC::InstanceType::C5aLarge           then "c5a.large"
      when AEC::InstanceType::C5aXlarge          then "c5a.xlarge"
      when AEC::InstanceType::C5a2xlarge         then "c5a.2xlarge"
      when AEC::InstanceType::C5a4xlarge         then "c5a.4xlarge"
      when AEC::InstanceType::C5a8xlarge         then "c5a.8xlarge"
      when AEC::InstanceType::C5a12xlarge        then "c5a.12xlarge"
      when AEC::InstanceType::C5a16xlarge        then "c5a.16xlarge"
      when AEC::InstanceType::C5a24xlarge        then "c5a.24xlarge"
      when AEC::InstanceType::C5adLarge          then "c5ad.large"
      when AEC::InstanceType::C5adXlarge         then "c5ad.xlarge"
      when AEC::InstanceType::C5ad2xlarge        then "c5ad.2xlarge"
      when AEC::InstanceType::C5ad4xlarge        then "c5ad.4xlarge"
      when AEC::InstanceType::C5ad8xlarge        then "c5ad.8xlarge"
      when AEC::InstanceType::C5ad12xlarge       then "c5ad.12xlarge"
      when AEC::InstanceType::C5ad16xlarge       then "c5ad.16xlarge"
      when AEC::InstanceType::C5ad24xlarge       then "c5ad.24xlarge"
      when AEC::InstanceType::C5dLarge           then "c5d.large"
      when AEC::InstanceType::C5dXlarge          then "c5d.xlarge"
      when AEC::InstanceType::C5d2xlarge         then "c5d.2xlarge"
      when AEC::InstanceType::C5d4xlarge         then "c5d.4xlarge"
      when AEC::InstanceType::C5d9xlarge         then "c5d.9xlarge"
      when AEC::InstanceType::C5d12xlarge        then "c5d.12xlarge"
      when AEC::InstanceType::C5d18xlarge        then "c5d.18xlarge"
      when AEC::InstanceType::C5d24xlarge        then "c5d.24xlarge"
      when AEC::InstanceType::C5dMetal           then "c5d.metal"
      when AEC::InstanceType::C5nLarge           then "c5n.large"
      when AEC::InstanceType::C5nXlarge          then "c5n.xlarge"
      when AEC::InstanceType::C5n2xlarge         then "c5n.2xlarge"
      when AEC::InstanceType::C5n4xlarge         then "c5n.4xlarge"
      when AEC::InstanceType::C5n9xlarge         then "c5n.9xlarge"
      when AEC::InstanceType::C5n18xlarge        then "c5n.18xlarge"
      when AEC::InstanceType::C5nMetal           then "c5n.metal"
      when AEC::InstanceType::C6gMedium          then "c6g.medium"
      when AEC::InstanceType::C6gLarge           then "c6g.large"
      when AEC::InstanceType::C6gXlarge          then "c6g.xlarge"
      when AEC::InstanceType::C6g2xlarge         then "c6g.2xlarge"
      when AEC::InstanceType::C6g4xlarge         then "c6g.4xlarge"
      when AEC::InstanceType::C6g8xlarge         then "c6g.8xlarge"
      when AEC::InstanceType::C6g12xlarge        then "c6g.12xlarge"
      when AEC::InstanceType::C6g16xlarge        then "c6g.16xlarge"
      when AEC::InstanceType::C6gMetal           then "c6g.metal"
      when AEC::InstanceType::C6gdMedium         then "c6gd.medium"
      when AEC::InstanceType::C6gdLarge          then "c6gd.large"
      when AEC::InstanceType::C6gdXlarge         then "c6gd.xlarge"
      when AEC::InstanceType::C6gd2xlarge        then "c6gd.2xlarge"
      when AEC::InstanceType::C6gd4xlarge        then "c6gd.4xlarge"
      when AEC::InstanceType::C6gd8xlarge        then "c6gd.8xlarge"
      when AEC::InstanceType::C6gd12xlarge       then "c6gd.12xlarge"
      when AEC::InstanceType::C6gd16xlarge       then "c6gd.16xlarge"
      when AEC::InstanceType::C6gdMetal          then "c6gd.metal"
      when AEC::InstanceType::C6gnMedium         then "c6gn.medium"
      when AEC::InstanceType::C6gnLarge          then "c6gn.large"
      when AEC::InstanceType::C6gnXlarge         then "c6gn.xlarge"
      when AEC::InstanceType::C6gn2xlarge        then "c6gn.2xlarge"
      when AEC::InstanceType::C6gn4xlarge        then "c6gn.4xlarge"
      when AEC::InstanceType::C6gn8xlarge        then "c6gn.8xlarge"
      when AEC::InstanceType::C6gn12xlarge       then "c6gn.12xlarge"
      when AEC::InstanceType::C6gn16xlarge       then "c6gn.16xlarge"
      when AEC::InstanceType::C6iLarge           then "c6i.large"
      when AEC::InstanceType::C6iXlarge          then "c6i.xlarge"
      when AEC::InstanceType::C6i2xlarge         then "c6i.2xlarge"
      when AEC::InstanceType::C6i4xlarge         then "c6i.4xlarge"
      when AEC::InstanceType::C6i8xlarge         then "c6i.8xlarge"
      when AEC::InstanceType::C6i12xlarge        then "c6i.12xlarge"
      when AEC::InstanceType::C6i16xlarge        then "c6i.16xlarge"
      when AEC::InstanceType::C6i24xlarge        then "c6i.24xlarge"
      when AEC::InstanceType::C6i32xlarge        then "c6i.32xlarge"
      when AEC::InstanceType::C6iMetal           then "c6i.metal"
      when AEC::InstanceType::Cc14xlarge         then "cc1.4xlarge"
      when AEC::InstanceType::Cc28xlarge         then "cc2.8xlarge"
      when AEC::InstanceType::Cg14xlarge         then "cg1.4xlarge"
      when AEC::InstanceType::Cr18xlarge         then "cr1.8xlarge"
      when AEC::InstanceType::D2Xlarge           then "d2.xlarge"
      when AEC::InstanceType::D22xlarge          then "d2.2xlarge"
      when AEC::InstanceType::D24xlarge          then "d2.4xlarge"
      when AEC::InstanceType::D28xlarge          then "d2.8xlarge"
      when AEC::InstanceType::D3Xlarge           then "d3.xlarge"
      when AEC::InstanceType::D32xlarge          then "d3.2xlarge"
      when AEC::InstanceType::D34xlarge          then "d3.4xlarge"
      when AEC::InstanceType::D38xlarge          then "d3.8xlarge"
      when AEC::InstanceType::D3enXlarge         then "d3en.xlarge"
      when AEC::InstanceType::D3en2xlarge        then "d3en.2xlarge"
      when AEC::InstanceType::D3en4xlarge        then "d3en.4xlarge"
      when AEC::InstanceType::D3en6xlarge        then "d3en.6xlarge"
      when AEC::InstanceType::D3en8xlarge        then "d3en.8xlarge"
      when AEC::InstanceType::D3en12xlarge       then "d3en.12xlarge"
      when AEC::InstanceType::Dl124xlarge        then "dl1.24xlarge"
      when AEC::InstanceType::F12xlarge          then "f1.2xlarge"
      when AEC::InstanceType::F14xlarge          then "f1.4xlarge"
      when AEC::InstanceType::F116xlarge         then "f1.16xlarge"
      when AEC::InstanceType::G22xlarge          then "g2.2xlarge"
      when AEC::InstanceType::G28xlarge          then "g2.8xlarge"
      when AEC::InstanceType::G34xlarge          then "g3.4xlarge"
      when AEC::InstanceType::G38xlarge          then "g3.8xlarge"
      when AEC::InstanceType::G316xlarge         then "g3.16xlarge"
      when AEC::InstanceType::G3sXlarge          then "g3s.xlarge"
      when AEC::InstanceType::G4adXlarge         then "g4ad.xlarge"
      when AEC::InstanceType::G4ad2xlarge        then "g4ad.2xlarge"
      when AEC::InstanceType::G4ad4xlarge        then "g4ad.4xlarge"
      when AEC::InstanceType::G4ad8xlarge        then "g4ad.8xlarge"
      when AEC::InstanceType::G4ad16xlarge       then "g4ad.16xlarge"
      when AEC::InstanceType::G4dnXlarge         then "g4dn.xlarge"
      when AEC::InstanceType::G4dn2xlarge        then "g4dn.2xlarge"
      when AEC::InstanceType::G4dn4xlarge        then "g4dn.4xlarge"
      when AEC::InstanceType::G4dn8xlarge        then "g4dn.8xlarge"
      when AEC::InstanceType::G4dn12xlarge       then "g4dn.12xlarge"
      when AEC::InstanceType::G4dn16xlarge       then "g4dn.16xlarge"
      when AEC::InstanceType::G4dnMetal          then "g4dn.metal"
      when AEC::InstanceType::G5Xlarge           then "g5.xlarge"
      when AEC::InstanceType::G52xlarge          then "g5.2xlarge"
      when AEC::InstanceType::G54xlarge          then "g5.4xlarge"
      when AEC::InstanceType::G58xlarge          then "g5.8xlarge"
      when AEC::InstanceType::G512xlarge         then "g5.12xlarge"
      when AEC::InstanceType::G516xlarge         then "g5.16xlarge"
      when AEC::InstanceType::G524xlarge         then "g5.24xlarge"
      when AEC::InstanceType::G548xlarge         then "g5.48xlarge"
      when AEC::InstanceType::G5gXlarge          then "g5g.xlarge"
      when AEC::InstanceType::G5g2xlarge         then "g5g.2xlarge"
      when AEC::InstanceType::G5g4xlarge         then "g5g.4xlarge"
      when AEC::InstanceType::G5g8xlarge         then "g5g.8xlarge"
      when AEC::InstanceType::G5g16xlarge        then "g5g.16xlarge"
      when AEC::InstanceType::G5gMetal           then "g5g.metal"
      when AEC::InstanceType::Hi14xlarge         then "hi1.4xlarge"
      when AEC::InstanceType::Hpc6a48xlarge      then "hpc6a.48xlarge"
      when AEC::InstanceType::Hs18xlarge         then "hs1.8xlarge"
      when AEC::InstanceType::H12xlarge          then "h1.2xlarge"
      when AEC::InstanceType::H14xlarge          then "h1.4xlarge"
      when AEC::InstanceType::H18xlarge          then "h1.8xlarge"
      when AEC::InstanceType::H116xlarge         then "h1.16xlarge"
      when AEC::InstanceType::I2Xlarge           then "i2.xlarge"
      when AEC::InstanceType::I22xlarge          then "i2.2xlarge"
      when AEC::InstanceType::I24xlarge          then "i2.4xlarge"
      when AEC::InstanceType::I28xlarge          then "i2.8xlarge"
      when AEC::InstanceType::I3Large            then "i3.large"
      when AEC::InstanceType::I3Xlarge           then "i3.xlarge"
      when AEC::InstanceType::I32xlarge          then "i3.2xlarge"
      when AEC::InstanceType::I34xlarge          then "i3.4xlarge"
      when AEC::InstanceType::I38xlarge          then "i3.8xlarge"
      when AEC::InstanceType::I316xlarge         then "i3.16xlarge"
      when AEC::InstanceType::I3Metal            then "i3.metal"
      when AEC::InstanceType::I3enLarge          then "i3en.large"
      when AEC::InstanceType::I3enXlarge         then "i3en.xlarge"
      when AEC::InstanceType::I3en2xlarge        then "i3en.2xlarge"
      when AEC::InstanceType::I3en3xlarge        then "i3en.3xlarge"
      when AEC::InstanceType::I3en6xlarge        then "i3en.6xlarge"
      when AEC::InstanceType::I3en12xlarge       then "i3en.12xlarge"
      when AEC::InstanceType::I3en24xlarge       then "i3en.24xlarge"
      when AEC::InstanceType::I3enMetal          then "i3en.metal"
      when AEC::InstanceType::Im4gnLarge         then "im4gn.large"
      when AEC::InstanceType::Im4gnXlarge        then "im4gn.xlarge"
      when AEC::InstanceType::Im4gn2xlarge       then "im4gn.2xlarge"
      when AEC::InstanceType::Im4gn4xlarge       then "im4gn.4xlarge"
      when AEC::InstanceType::Im4gn8xlarge       then "im4gn.8xlarge"
      when AEC::InstanceType::Im4gn16xlarge      then "im4gn.16xlarge"
      when AEC::InstanceType::Inf1Xlarge         then "inf1.xlarge"
      when AEC::InstanceType::Inf12xlarge        then "inf1.2xlarge"
      when AEC::InstanceType::Inf16xlarge        then "inf1.6xlarge"
      when AEC::InstanceType::Inf124xlarge       then "inf1.24xlarge"
      when AEC::InstanceType::Is4genMedium       then "is4gen.medium"
      when AEC::InstanceType::Is4genLarge        then "is4gen.large"
      when AEC::InstanceType::Is4genXlarge       then "is4gen.xlarge"
      when AEC::InstanceType::Is4gen2xlarge      then "is4gen.2xlarge"
      when AEC::InstanceType::Is4gen4xlarge      then "is4gen.4xlarge"
      when AEC::InstanceType::Is4gen8xlarge      then "is4gen.8xlarge"
      when AEC::InstanceType::M1Small            then "m1.small"
      when AEC::InstanceType::M1Medium           then "m1.medium"
      when AEC::InstanceType::M1Large            then "m1.large"
      when AEC::InstanceType::M1Xlarge           then "m1.xlarge"
      when AEC::InstanceType::M2Xlarge           then "m2.xlarge"
      when AEC::InstanceType::M22xlarge          then "m2.2xlarge"
      when AEC::InstanceType::M24xlarge          then "m2.4xlarge"
      when AEC::InstanceType::M3Medium           then "m3.medium"
      when AEC::InstanceType::M3Large            then "m3.large"
      when AEC::InstanceType::M3Xlarge           then "m3.xlarge"
      when AEC::InstanceType::M32xlarge          then "m3.2xlarge"
      when AEC::InstanceType::M4Large            then "m4.large"
      when AEC::InstanceType::M4Xlarge           then "m4.xlarge"
      when AEC::InstanceType::M42xlarge          then "m4.2xlarge"
      when AEC::InstanceType::M44xlarge          then "m4.4xlarge"
      when AEC::InstanceType::M410xlarge         then "m4.10xlarge"
      when AEC::InstanceType::M416xlarge         then "m4.16xlarge"
      when AEC::InstanceType::M5Large            then "m5.large"
      when AEC::InstanceType::M5Xlarge           then "m5.xlarge"
      when AEC::InstanceType::M52xlarge          then "m5.2xlarge"
      when AEC::InstanceType::M54xlarge          then "m5.4xlarge"
      when AEC::InstanceType::M58xlarge          then "m5.8xlarge"
      when AEC::InstanceType::M512xlarge         then "m5.12xlarge"
      when AEC::InstanceType::M516xlarge         then "m5.16xlarge"
      when AEC::InstanceType::M524xlarge         then "m5.24xlarge"
      when AEC::InstanceType::M5Metal            then "m5.metal"
      when AEC::InstanceType::M5aLarge           then "m5a.large"
      when AEC::InstanceType::M5aXlarge          then "m5a.xlarge"
      when AEC::InstanceType::M5a2xlarge         then "m5a.2xlarge"
      when AEC::InstanceType::M5a4xlarge         then "m5a.4xlarge"
      when AEC::InstanceType::M5a8xlarge         then "m5a.8xlarge"
      when AEC::InstanceType::M5a12xlarge        then "m5a.12xlarge"
      when AEC::InstanceType::M5a16xlarge        then "m5a.16xlarge"
      when AEC::InstanceType::M5a24xlarge        then "m5a.24xlarge"
      when AEC::InstanceType::M5adLarge          then "m5ad.large"
      when AEC::InstanceType::M5adXlarge         then "m5ad.xlarge"
      when AEC::InstanceType::M5ad2xlarge        then "m5ad.2xlarge"
      when AEC::InstanceType::M5ad4xlarge        then "m5ad.4xlarge"
      when AEC::InstanceType::M5ad8xlarge        then "m5ad.8xlarge"
      when AEC::InstanceType::M5ad12xlarge       then "m5ad.12xlarge"
      when AEC::InstanceType::M5ad16xlarge       then "m5ad.16xlarge"
      when AEC::InstanceType::M5ad24xlarge       then "m5ad.24xlarge"
      when AEC::InstanceType::M5dLarge           then "m5d.large"
      when AEC::InstanceType::M5dXlarge          then "m5d.xlarge"
      when AEC::InstanceType::M5d2xlarge         then "m5d.2xlarge"
      when AEC::InstanceType::M5d4xlarge         then "m5d.4xlarge"
      when AEC::InstanceType::M5d8xlarge         then "m5d.8xlarge"
      when AEC::InstanceType::M5d12xlarge        then "m5d.12xlarge"
      when AEC::InstanceType::M5d16xlarge        then "m5d.16xlarge"
      when AEC::InstanceType::M5d24xlarge        then "m5d.24xlarge"
      when AEC::InstanceType::M5dMetal           then "m5d.metal"
      when AEC::InstanceType::M5dnLarge          then "m5dn.large"
      when AEC::InstanceType::M5dnXlarge         then "m5dn.xlarge"
      when AEC::InstanceType::M5dn2xlarge        then "m5dn.2xlarge"
      when AEC::InstanceType::M5dn4xlarge        then "m5dn.4xlarge"
      when AEC::InstanceType::M5dn8xlarge        then "m5dn.8xlarge"
      when AEC::InstanceType::M5dn12xlarge       then "m5dn.12xlarge"
      when AEC::InstanceType::M5dn16xlarge       then "m5dn.16xlarge"
      when AEC::InstanceType::M5dn24xlarge       then "m5dn.24xlarge"
      when AEC::InstanceType::M5dnMetal          then "m5dn.metal"
      when AEC::InstanceType::M5nLarge           then "m5n.large"
      when AEC::InstanceType::M5nXlarge          then "m5n.xlarge"
      when AEC::InstanceType::M5n2xlarge         then "m5n.2xlarge"
      when AEC::InstanceType::M5n4xlarge         then "m5n.4xlarge"
      when AEC::InstanceType::M5n8xlarge         then "m5n.8xlarge"
      when AEC::InstanceType::M5n12xlarge        then "m5n.12xlarge"
      when AEC::InstanceType::M5n16xlarge        then "m5n.16xlarge"
      when AEC::InstanceType::M5n24xlarge        then "m5n.24xlarge"
      when AEC::InstanceType::M5nMetal           then "m5n.metal"
      when AEC::InstanceType::M5znLarge          then "m5zn.large"
      when AEC::InstanceType::M5znXlarge         then "m5zn.xlarge"
      when AEC::InstanceType::M5zn2xlarge        then "m5zn.2xlarge"
      when AEC::InstanceType::M5zn3xlarge        then "m5zn.3xlarge"
      when AEC::InstanceType::M5zn6xlarge        then "m5zn.6xlarge"
      when AEC::InstanceType::M5zn12xlarge       then "m5zn.12xlarge"
      when AEC::InstanceType::M5znMetal          then "m5zn.metal"
      when AEC::InstanceType::M6aLarge           then "m6a.large"
      when AEC::InstanceType::M6aXlarge          then "m6a.xlarge"
      when AEC::InstanceType::M6a2xlarge         then "m6a.2xlarge"
      when AEC::InstanceType::M6a4xlarge         then "m6a.4xlarge"
      when AEC::InstanceType::M6a8xlarge         then "m6a.8xlarge"
      when AEC::InstanceType::M6a12xlarge        then "m6a.12xlarge"
      when AEC::InstanceType::M6a16xlarge        then "m6a.16xlarge"
      when AEC::InstanceType::M6a24xlarge        then "m6a.24xlarge"
      when AEC::InstanceType::M6a32xlarge        then "m6a.32xlarge"
      when AEC::InstanceType::M6a48xlarge        then "m6a.48xlarge"
      when AEC::InstanceType::M6gMetal           then "m6g.metal"
      when AEC::InstanceType::M6gMedium          then "m6g.medium"
      when AEC::InstanceType::M6gLarge           then "m6g.large"
      when AEC::InstanceType::M6gXlarge          then "m6g.xlarge"
      when AEC::InstanceType::M6g2xlarge         then "m6g.2xlarge"
      when AEC::InstanceType::M6g4xlarge         then "m6g.4xlarge"
      when AEC::InstanceType::M6g8xlarge         then "m6g.8xlarge"
      when AEC::InstanceType::M6g12xlarge        then "m6g.12xlarge"
      when AEC::InstanceType::M6g16xlarge        then "m6g.16xlarge"
      when AEC::InstanceType::M6gdMetal          then "m6gd.metal"
      when AEC::InstanceType::M6gdMedium         then "m6gd.medium"
      when AEC::InstanceType::M6gdLarge          then "m6gd.large"
      when AEC::InstanceType::M6gdXlarge         then "m6gd.xlarge"
      when AEC::InstanceType::M6gd2xlarge        then "m6gd.2xlarge"
      when AEC::InstanceType::M6gd4xlarge        then "m6gd.4xlarge"
      when AEC::InstanceType::M6gd8xlarge        then "m6gd.8xlarge"
      when AEC::InstanceType::M6gd12xlarge       then "m6gd.12xlarge"
      when AEC::InstanceType::M6gd16xlarge       then "m6gd.16xlarge"
      when AEC::InstanceType::M6iLarge           then "m6i.large"
      when AEC::InstanceType::M6iXlarge          then "m6i.xlarge"
      when AEC::InstanceType::M6i2xlarge         then "m6i.2xlarge"
      when AEC::InstanceType::M6i4xlarge         then "m6i.4xlarge"
      when AEC::InstanceType::M6i8xlarge         then "m6i.8xlarge"
      when AEC::InstanceType::M6i12xlarge        then "m6i.12xlarge"
      when AEC::InstanceType::M6i16xlarge        then "m6i.16xlarge"
      when AEC::InstanceType::M6i24xlarge        then "m6i.24xlarge"
      when AEC::InstanceType::M6i32xlarge        then "m6i.32xlarge"
      when AEC::InstanceType::M6iMetal           then "m6i.metal"
      when AEC::InstanceType::Mac1Metal          then "mac1.metal"
      when AEC::InstanceType::P2Xlarge           then "p2.xlarge"
      when AEC::InstanceType::P28xlarge          then "p2.8xlarge"
      when AEC::InstanceType::P216xlarge         then "p2.16xlarge"
      when AEC::InstanceType::P32xlarge          then "p3.2xlarge"
      when AEC::InstanceType::P38xlarge          then "p3.8xlarge"
      when AEC::InstanceType::P316xlarge         then "p3.16xlarge"
      when AEC::InstanceType::P3dn24xlarge       then "p3dn.24xlarge"
      when AEC::InstanceType::P4d24xlarge        then "p4d.24xlarge"
      when AEC::InstanceType::R3Large            then "r3.large"
      when AEC::InstanceType::R3Xlarge           then "r3.xlarge"
      when AEC::InstanceType::R32xlarge          then "r3.2xlarge"
      when AEC::InstanceType::R34xlarge          then "r3.4xlarge"
      when AEC::InstanceType::R38xlarge          then "r3.8xlarge"
      when AEC::InstanceType::R4Large            then "r4.large"
      when AEC::InstanceType::R4Xlarge           then "r4.xlarge"
      when AEC::InstanceType::R42xlarge          then "r4.2xlarge"
      when AEC::InstanceType::R44xlarge          then "r4.4xlarge"
      when AEC::InstanceType::R48xlarge          then "r4.8xlarge"
      when AEC::InstanceType::R416xlarge         then "r4.16xlarge"
      when AEC::InstanceType::R5Large            then "r5.large"
      when AEC::InstanceType::R5Xlarge           then "r5.xlarge"
      when AEC::InstanceType::R52xlarge          then "r5.2xlarge"
      when AEC::InstanceType::R54xlarge          then "r5.4xlarge"
      when AEC::InstanceType::R58xlarge          then "r5.8xlarge"
      when AEC::InstanceType::R512xlarge         then "r5.12xlarge"
      when AEC::InstanceType::R516xlarge         then "r5.16xlarge"
      when AEC::InstanceType::R524xlarge         then "r5.24xlarge"
      when AEC::InstanceType::R5Metal            then "r5.metal"
      when AEC::InstanceType::R5aLarge           then "r5a.large"
      when AEC::InstanceType::R5aXlarge          then "r5a.xlarge"
      when AEC::InstanceType::R5a2xlarge         then "r5a.2xlarge"
      when AEC::InstanceType::R5a4xlarge         then "r5a.4xlarge"
      when AEC::InstanceType::R5a8xlarge         then "r5a.8xlarge"
      when AEC::InstanceType::R5a12xlarge        then "r5a.12xlarge"
      when AEC::InstanceType::R5a16xlarge        then "r5a.16xlarge"
      when AEC::InstanceType::R5a24xlarge        then "r5a.24xlarge"
      when AEC::InstanceType::R5adLarge          then "r5ad.large"
      when AEC::InstanceType::R5adXlarge         then "r5ad.xlarge"
      when AEC::InstanceType::R5ad2xlarge        then "r5ad.2xlarge"
      when AEC::InstanceType::R5ad4xlarge        then "r5ad.4xlarge"
      when AEC::InstanceType::R5ad8xlarge        then "r5ad.8xlarge"
      when AEC::InstanceType::R5ad12xlarge       then "r5ad.12xlarge"
      when AEC::InstanceType::R5ad16xlarge       then "r5ad.16xlarge"
      when AEC::InstanceType::R5ad24xlarge       then "r5ad.24xlarge"
      when AEC::InstanceType::R5bLarge           then "r5b.large"
      when AEC::InstanceType::R5bXlarge          then "r5b.xlarge"
      when AEC::InstanceType::R5b2xlarge         then "r5b.2xlarge"
      when AEC::InstanceType::R5b4xlarge         then "r5b.4xlarge"
      when AEC::InstanceType::R5b8xlarge         then "r5b.8xlarge"
      when AEC::InstanceType::R5b12xlarge        then "r5b.12xlarge"
      when AEC::InstanceType::R5b16xlarge        then "r5b.16xlarge"
      when AEC::InstanceType::R5b24xlarge        then "r5b.24xlarge"
      when AEC::InstanceType::R5bMetal           then "r5b.metal"
      when AEC::InstanceType::R5dLarge           then "r5d.large"
      when AEC::InstanceType::R5dXlarge          then "r5d.xlarge"
      when AEC::InstanceType::R5d2xlarge         then "r5d.2xlarge"
      when AEC::InstanceType::R5d4xlarge         then "r5d.4xlarge"
      when AEC::InstanceType::R5d8xlarge         then "r5d.8xlarge"
      when AEC::InstanceType::R5d12xlarge        then "r5d.12xlarge"
      when AEC::InstanceType::R5d16xlarge        then "r5d.16xlarge"
      when AEC::InstanceType::R5d24xlarge        then "r5d.24xlarge"
      when AEC::InstanceType::R5dMetal           then "r5d.metal"
      when AEC::InstanceType::R5dnLarge          then "r5dn.large"
      when AEC::InstanceType::R5dnXlarge         then "r5dn.xlarge"
      when AEC::InstanceType::R5dn2xlarge        then "r5dn.2xlarge"
      when AEC::InstanceType::R5dn4xlarge        then "r5dn.4xlarge"
      when AEC::InstanceType::R5dn8xlarge        then "r5dn.8xlarge"
      when AEC::InstanceType::R5dn12xlarge       then "r5dn.12xlarge"
      when AEC::InstanceType::R5dn16xlarge       then "r5dn.16xlarge"
      when AEC::InstanceType::R5dn24xlarge       then "r5dn.24xlarge"
      when AEC::InstanceType::R5dnMetal          then "r5dn.metal"
      when AEC::InstanceType::R5nLarge           then "r5n.large"
      when AEC::InstanceType::R5nXlarge          then "r5n.xlarge"
      when AEC::InstanceType::R5n2xlarge         then "r5n.2xlarge"
      when AEC::InstanceType::R5n4xlarge         then "r5n.4xlarge"
      when AEC::InstanceType::R5n8xlarge         then "r5n.8xlarge"
      when AEC::InstanceType::R5n12xlarge        then "r5n.12xlarge"
      when AEC::InstanceType::R5n16xlarge        then "r5n.16xlarge"
      when AEC::InstanceType::R5n24xlarge        then "r5n.24xlarge"
      when AEC::InstanceType::R5nMetal           then "r5n.metal"
      when AEC::InstanceType::R6gMedium          then "r6g.medium"
      when AEC::InstanceType::R6gLarge           then "r6g.large"
      when AEC::InstanceType::R6gXlarge          then "r6g.xlarge"
      when AEC::InstanceType::R6g2xlarge         then "r6g.2xlarge"
      when AEC::InstanceType::R6g4xlarge         then "r6g.4xlarge"
      when AEC::InstanceType::R6g8xlarge         then "r6g.8xlarge"
      when AEC::InstanceType::R6g12xlarge        then "r6g.12xlarge"
      when AEC::InstanceType::R6g16xlarge        then "r6g.16xlarge"
      when AEC::InstanceType::R6gMetal           then "r6g.metal"
      when AEC::InstanceType::R6gdMedium         then "r6gd.medium"
      when AEC::InstanceType::R6gdLarge          then "r6gd.large"
      when AEC::InstanceType::R6gdXlarge         then "r6gd.xlarge"
      when AEC::InstanceType::R6gd2xlarge        then "r6gd.2xlarge"
      when AEC::InstanceType::R6gd4xlarge        then "r6gd.4xlarge"
      when AEC::InstanceType::R6gd8xlarge        then "r6gd.8xlarge"
      when AEC::InstanceType::R6gd12xlarge       then "r6gd.12xlarge"
      when AEC::InstanceType::R6gd16xlarge       then "r6gd.16xlarge"
      when AEC::InstanceType::R6gdMetal          then "r6gd.metal"
      when AEC::InstanceType::R6iLarge           then "r6i.large"
      when AEC::InstanceType::R6iXlarge          then "r6i.xlarge"
      when AEC::InstanceType::R6i2xlarge         then "r6i.2xlarge"
      when AEC::InstanceType::R6i4xlarge         then "r6i.4xlarge"
      when AEC::InstanceType::R6i8xlarge         then "r6i.8xlarge"
      when AEC::InstanceType::R6i12xlarge        then "r6i.12xlarge"
      when AEC::InstanceType::R6i16xlarge        then "r6i.16xlarge"
      when AEC::InstanceType::R6i24xlarge        then "r6i.24xlarge"
      when AEC::InstanceType::R6i32xlarge        then "r6i.32xlarge"
      when AEC::InstanceType::R6iMetal           then "r6i.metal"
      when AEC::InstanceType::T1Micro            then "t1.micro"
      when AEC::InstanceType::T2Nano             then "t2.nano"
      when AEC::InstanceType::T2Micro            then "t2.micro"
      when AEC::InstanceType::T2Small            then "t2.small"
      when AEC::InstanceType::T2Medium           then "t2.medium"
      when AEC::InstanceType::T2Large            then "t2.large"
      when AEC::InstanceType::T2Xlarge           then "t2.xlarge"
      when AEC::InstanceType::T22xlarge          then "t2.2xlarge"
      when AEC::InstanceType::T3Nano             then "t3.nano"
      when AEC::InstanceType::T3Micro            then "t3.micro"
      when AEC::InstanceType::T3Small            then "t3.small"
      when AEC::InstanceType::T3Medium           then "t3.medium"
      when AEC::InstanceType::T3Large            then "t3.large"
      when AEC::InstanceType::T3Xlarge           then "t3.xlarge"
      when AEC::InstanceType::T32xlarge          then "t3.2xlarge"
      when AEC::InstanceType::T3aNano            then "t3a.nano"
      when AEC::InstanceType::T3aMicro           then "t3a.micro"
      when AEC::InstanceType::T3aSmall           then "t3a.small"
      when AEC::InstanceType::T3aMedium          then "t3a.medium"
      when AEC::InstanceType::T3aLarge           then "t3a.large"
      when AEC::InstanceType::T3aXlarge          then "t3a.xlarge"
      when AEC::InstanceType::T3a2xlarge         then "t3a.2xlarge"
      when AEC::InstanceType::T4gNano            then "t4g.nano"
      when AEC::InstanceType::T4gMicro           then "t4g.micro"
      when AEC::InstanceType::T4gSmall           then "t4g.small"
      when AEC::InstanceType::T4gMedium          then "t4g.medium"
      when AEC::InstanceType::T4gLarge           then "t4g.large"
      when AEC::InstanceType::T4gXlarge          then "t4g.xlarge"
      when AEC::InstanceType::T4g2xlarge         then "t4g.2xlarge"
      when AEC::InstanceType::U6tb156xlarge      then "u-6tb1.56xlarge"
      when AEC::InstanceType::U6tb1112xlarge     then "u-6tb1.112xlarge"
      when AEC::InstanceType::U9tb1112xlarge     then "u-9tb1.112xlarge"
      when AEC::InstanceType::U12tb1112xlarge    then "u-12tb1.112xlarge"
      when AEC::InstanceType::U6tb1Metal         then "u-6tb1.metal"
      when AEC::InstanceType::U9tb1Metal         then "u-9tb1.metal"
      when AEC::InstanceType::U12tb1Metal        then "u-12tb1.metal"
      when AEC::InstanceType::U18tb1Metal        then "u-18tb1.metal"
      when AEC::InstanceType::U24tb1Metal        then "u-24tb1.metal"
      when AEC::InstanceType::Vt13xlarge         then "vt1.3xlarge"
      when AEC::InstanceType::Vt16xlarge         then "vt1.6xlarge"
      when AEC::InstanceType::Vt124xlarge        then "vt1.24xlarge"
      when AEC::InstanceType::X116xlarge         then "x1.16xlarge"
      when AEC::InstanceType::X132xlarge         then "x1.32xlarge"
      when AEC::InstanceType::X1eXlarge          then "x1e.xlarge"
      when AEC::InstanceType::X1e2xlarge         then "x1e.2xlarge"
      when AEC::InstanceType::X1e4xlarge         then "x1e.4xlarge"
      when AEC::InstanceType::X1e8xlarge         then "x1e.8xlarge"
      when AEC::InstanceType::X1e16xlarge        then "x1e.16xlarge"
      when AEC::InstanceType::X1e32xlarge        then "x1e.32xlarge"
      when AEC::InstanceType::X2iezn2xlarge      then "x2iezn.2xlarge"
      when AEC::InstanceType::X2iezn4xlarge      then "x2iezn.4xlarge"
      when AEC::InstanceType::X2iezn6xlarge      then "x2iezn.6xlarge"
      when AEC::InstanceType::X2iezn8xlarge      then "x2iezn.8xlarge"
      when AEC::InstanceType::X2iezn12xlarge     then "x2iezn.12xlarge"
      when AEC::InstanceType::X2ieznMetal        then "x2iezn.metal"
      when AEC::InstanceType::X2gdMedium         then "x2gd.medium"
      when AEC::InstanceType::X2gdLarge          then "x2gd.large"
      when AEC::InstanceType::X2gdXlarge         then "x2gd.xlarge"
      when AEC::InstanceType::X2gd2xlarge        then "x2gd.2xlarge"
      when AEC::InstanceType::X2gd4xlarge        then "x2gd.4xlarge"
      when AEC::InstanceType::X2gd8xlarge        then "x2gd.8xlarge"
      when AEC::InstanceType::X2gd12xlarge       then "x2gd.12xlarge"
      when AEC::InstanceType::X2gd16xlarge       then "x2gd.16xlarge"
      when AEC::InstanceType::X2gdMetal          then "x2gd.metal"
      when AEC::InstanceType::Z1dLarge           then "z1d.large"
      when AEC::InstanceType::Z1dXlarge          then "z1d.xlarge"
      when AEC::InstanceType::Z1d2xlarge         then "z1d.2xlarge"
      when AEC::InstanceType::Z1d3xlarge         then "z1d.3xlarge"
      when AEC::InstanceType::Z1d6xlarge         then "z1d.6xlarge"
      when AEC::InstanceType::Z1d12xlarge        then "z1d.12xlarge"
      when AEC::InstanceType::Z1dMetal           then "z1d.metal"
      when AEC::InstanceType::X2idn16xlarge      then "x2idn.16xlarge"
      when AEC::InstanceType::X2idn24xlarge      then "x2idn.24xlarge"
      when AEC::InstanceType::X2idn32xlarge      then "x2idn.32xlarge"
      when AEC::InstanceType::X2iednXlarge       then "x2iedn.xlarge"
      when AEC::InstanceType::X2iedn2xlarge      then "x2iedn.2xlarge"
      when AEC::InstanceType::X2iedn4xlarge      then "x2iedn.4xlarge"
      when AEC::InstanceType::X2iedn8xlarge      then "x2iedn.8xlarge"
      when AEC::InstanceType::X2iedn16xlarge     then "x2iedn.16xlarge"
      when AEC::InstanceType::X2iedn24xlarge     then "x2iedn.24xlarge"
      when AEC::InstanceType::X2iedn32xlarge     then "x2iedn.32xlarge"
      when AEC::InstanceType::C6aLarge           then "c6a.large"
      when AEC::InstanceType::C6aXlarge          then "c6a.xlarge"
      when AEC::InstanceType::C6a2xlarge         then "c6a.2xlarge"
      when AEC::InstanceType::C6a4xlarge         then "c6a.4xlarge"
      when AEC::InstanceType::C6a8xlarge         then "c6a.8xlarge"
      when AEC::InstanceType::C6a12xlarge        then "c6a.12xlarge"
      when AEC::InstanceType::C6a16xlarge        then "c6a.16xlarge"
      when AEC::InstanceType::C6a24xlarge        then "c6a.24xlarge"
      when AEC::InstanceType::C6a32xlarge        then "c6a.32xlarge"
      when AEC::InstanceType::C6a48xlarge        then "c6a.48xlarge"
      when AEC::InstanceType::C6aMetal           then "c6a.metal"
      when AEC::InstanceType::M6aMetal           then "m6a.metal"
      when AEC::InstanceType::I4iLarge           then "i4i.large"
      when AEC::InstanceType::I4iXlarge          then "i4i.xlarge"
      when AEC::InstanceType::I4i2xlarge         then "i4i.2xlarge"
      when AEC::InstanceType::I4i4xlarge         then "i4i.4xlarge"
      when AEC::InstanceType::I4i8xlarge         then "i4i.8xlarge"
      when AEC::InstanceType::I4i16xlarge        then "i4i.16xlarge"
      when AEC::InstanceType::I4i32xlarge        then "i4i.32xlarge"
      when AEC::InstanceType::I4iMetal           then "i4i.metal"
      when AEC::InstanceType::X2idnMetal         then "x2idn.metal"
      when AEC::InstanceType::X2iednMetal        then "x2iedn.metal"
      when AEC::InstanceType::C7gMedium          then "c7g.medium"
      when AEC::InstanceType::C7gLarge           then "c7g.large"
      when AEC::InstanceType::C7gXlarge          then "c7g.xlarge"
      when AEC::InstanceType::C7g2xlarge         then "c7g.2xlarge"
      when AEC::InstanceType::C7g4xlarge         then "c7g.4xlarge"
      when AEC::InstanceType::C7g8xlarge         then "c7g.8xlarge"
      when AEC::InstanceType::C7g12xlarge        then "c7g.12xlarge"
      when AEC::InstanceType::C7g16xlarge        then "c7g.16xlarge"
      when AEC::InstanceType::Mac2Metal          then "mac2.metal"
      when AEC::InstanceType::C6idLarge          then "c6id.large"
      when AEC::InstanceType::C6idXlarge         then "c6id.xlarge"
      when AEC::InstanceType::C6id2xlarge        then "c6id.2xlarge"
      when AEC::InstanceType::C6id4xlarge        then "c6id.4xlarge"
      when AEC::InstanceType::C6id8xlarge        then "c6id.8xlarge"
      when AEC::InstanceType::C6id12xlarge       then "c6id.12xlarge"
      when AEC::InstanceType::C6id16xlarge       then "c6id.16xlarge"
      when AEC::InstanceType::C6id24xlarge       then "c6id.24xlarge"
      when AEC::InstanceType::C6id32xlarge       then "c6id.32xlarge"
      when AEC::InstanceType::C6idMetal          then "c6id.metal"
      when AEC::InstanceType::M6idLarge          then "m6id.large"
      when AEC::InstanceType::M6idXlarge         then "m6id.xlarge"
      when AEC::InstanceType::M6id2xlarge        then "m6id.2xlarge"
      when AEC::InstanceType::M6id4xlarge        then "m6id.4xlarge"
      when AEC::InstanceType::M6id8xlarge        then "m6id.8xlarge"
      when AEC::InstanceType::M6id12xlarge       then "m6id.12xlarge"
      when AEC::InstanceType::M6id16xlarge       then "m6id.16xlarge"
      when AEC::InstanceType::M6id24xlarge       then "m6id.24xlarge"
      when AEC::InstanceType::M6id32xlarge       then "m6id.32xlarge"
      when AEC::InstanceType::M6idMetal          then "m6id.metal"
      when AEC::InstanceType::R6idLarge          then "r6id.large"
      when AEC::InstanceType::R6idXlarge         then "r6id.xlarge"
      when AEC::InstanceType::R6id2xlarge        then "r6id.2xlarge"
      when AEC::InstanceType::R6id4xlarge        then "r6id.4xlarge"
      when AEC::InstanceType::R6id8xlarge        then "r6id.8xlarge"
      when AEC::InstanceType::R6id12xlarge       then "r6id.12xlarge"
      when AEC::InstanceType::R6id16xlarge       then "r6id.16xlarge"
      when AEC::InstanceType::R6id24xlarge       then "r6id.24xlarge"
      when AEC::InstanceType::R6id32xlarge       then "r6id.32xlarge"
      when AEC::InstanceType::R6idMetal          then "r6id.metal"
      when AEC::InstanceType::R6aLarge           then "r6a.large"
      when AEC::InstanceType::R6aXlarge          then "r6a.xlarge"
      when AEC::InstanceType::R6a2xlarge         then "r6a.2xlarge"
      when AEC::InstanceType::R6a4xlarge         then "r6a.4xlarge"
      when AEC::InstanceType::R6a8xlarge         then "r6a.8xlarge"
      when AEC::InstanceType::R6a12xlarge        then "r6a.12xlarge"
      when AEC::InstanceType::R6a16xlarge        then "r6a.16xlarge"
      when AEC::InstanceType::R6a24xlarge        then "r6a.24xlarge"
      when AEC::InstanceType::R6a32xlarge        then "r6a.32xlarge"
      when AEC::InstanceType::R6a48xlarge        then "r6a.48xlarge"
      when AEC::InstanceType::R6aMetal           then "r6a.metal"
      when AEC::InstanceType::P4de24xlarge       then "p4de.24xlarge"
      when AEC::InstanceType::U3tb156xlarge      then "u-3tb1.56xlarge"
      when AEC::InstanceType::U18tb1112xlarge    then "u-18tb1.112xlarge"
      when AEC::InstanceType::U24tb1112xlarge    then "u-24tb1.112xlarge"
      when AEC::InstanceType::Trn12xlarge        then "trn1.2xlarge"
      when AEC::InstanceType::Trn132xlarge       then "trn1.32xlarge"
      when AEC::InstanceType::Hpc6id32xlarge     then "hpc6id.32xlarge"
      when AEC::InstanceType::C6inLarge          then "c6in.large"
      when AEC::InstanceType::C6inXlarge         then "c6in.xlarge"
      when AEC::InstanceType::C6in2xlarge        then "c6in.2xlarge"
      when AEC::InstanceType::C6in4xlarge        then "c6in.4xlarge"
      when AEC::InstanceType::C6in8xlarge        then "c6in.8xlarge"
      when AEC::InstanceType::C6in12xlarge       then "c6in.12xlarge"
      when AEC::InstanceType::C6in16xlarge       then "c6in.16xlarge"
      when AEC::InstanceType::C6in24xlarge       then "c6in.24xlarge"
      when AEC::InstanceType::C6in32xlarge       then "c6in.32xlarge"
      when AEC::InstanceType::M6inLarge          then "m6in.large"
      when AEC::InstanceType::M6inXlarge         then "m6in.xlarge"
      when AEC::InstanceType::M6in2xlarge        then "m6in.2xlarge"
      when AEC::InstanceType::M6in4xlarge        then "m6in.4xlarge"
      when AEC::InstanceType::M6in8xlarge        then "m6in.8xlarge"
      when AEC::InstanceType::M6in12xlarge       then "m6in.12xlarge"
      when AEC::InstanceType::M6in16xlarge       then "m6in.16xlarge"
      when AEC::InstanceType::M6in24xlarge       then "m6in.24xlarge"
      when AEC::InstanceType::M6in32xlarge       then "m6in.32xlarge"
      when AEC::InstanceType::M6idnLarge         then "m6idn.large"
      when AEC::InstanceType::M6idnXlarge        then "m6idn.xlarge"
      when AEC::InstanceType::M6idn2xlarge       then "m6idn.2xlarge"
      when AEC::InstanceType::M6idn4xlarge       then "m6idn.4xlarge"
      when AEC::InstanceType::M6idn8xlarge       then "m6idn.8xlarge"
      when AEC::InstanceType::M6idn12xlarge      then "m6idn.12xlarge"
      when AEC::InstanceType::M6idn16xlarge      then "m6idn.16xlarge"
      when AEC::InstanceType::M6idn24xlarge      then "m6idn.24xlarge"
      when AEC::InstanceType::M6idn32xlarge      then "m6idn.32xlarge"
      when AEC::InstanceType::R6inLarge          then "r6in.large"
      when AEC::InstanceType::R6inXlarge         then "r6in.xlarge"
      when AEC::InstanceType::R6in2xlarge        then "r6in.2xlarge"
      when AEC::InstanceType::R6in4xlarge        then "r6in.4xlarge"
      when AEC::InstanceType::R6in8xlarge        then "r6in.8xlarge"
      when AEC::InstanceType::R6in12xlarge       then "r6in.12xlarge"
      when AEC::InstanceType::R6in16xlarge       then "r6in.16xlarge"
      when AEC::InstanceType::R6in24xlarge       then "r6in.24xlarge"
      when AEC::InstanceType::R6in32xlarge       then "r6in.32xlarge"
      when AEC::InstanceType::R6idnLarge         then "r6idn.large"
      when AEC::InstanceType::R6idnXlarge        then "r6idn.xlarge"
      when AEC::InstanceType::R6idn2xlarge       then "r6idn.2xlarge"
      when AEC::InstanceType::R6idn4xlarge       then "r6idn.4xlarge"
      when AEC::InstanceType::R6idn8xlarge       then "r6idn.8xlarge"
      when AEC::InstanceType::R6idn12xlarge      then "r6idn.12xlarge"
      when AEC::InstanceType::R6idn16xlarge      then "r6idn.16xlarge"
      when AEC::InstanceType::R6idn24xlarge      then "r6idn.24xlarge"
      when AEC::InstanceType::R6idn32xlarge      then "r6idn.32xlarge"
      when AEC::InstanceType::C7gMetal           then "c7g.metal"
      when AEC::InstanceType::M7gMedium          then "m7g.medium"
      when AEC::InstanceType::M7gLarge           then "m7g.large"
      when AEC::InstanceType::M7gXlarge          then "m7g.xlarge"
      when AEC::InstanceType::M7g2xlarge         then "m7g.2xlarge"
      when AEC::InstanceType::M7g4xlarge         then "m7g.4xlarge"
      when AEC::InstanceType::M7g8xlarge         then "m7g.8xlarge"
      when AEC::InstanceType::M7g12xlarge        then "m7g.12xlarge"
      when AEC::InstanceType::M7g16xlarge        then "m7g.16xlarge"
      when AEC::InstanceType::M7gMetal           then "m7g.metal"
      when AEC::InstanceType::R7gMedium          then "r7g.medium"
      when AEC::InstanceType::R7gLarge           then "r7g.large"
      when AEC::InstanceType::R7gXlarge          then "r7g.xlarge"
      when AEC::InstanceType::R7g2xlarge         then "r7g.2xlarge"
      when AEC::InstanceType::R7g4xlarge         then "r7g.4xlarge"
      when AEC::InstanceType::R7g8xlarge         then "r7g.8xlarge"
      when AEC::InstanceType::R7g12xlarge        then "r7g.12xlarge"
      when AEC::InstanceType::R7g16xlarge        then "r7g.16xlarge"
      when AEC::InstanceType::R7gMetal           then "r7g.metal"
      when AEC::InstanceType::C6inMetal          then "c6in.metal"
      when AEC::InstanceType::M6inMetal          then "m6in.metal"
      when AEC::InstanceType::M6idnMetal         then "m6idn.metal"
      when AEC::InstanceType::R6inMetal          then "r6in.metal"
      when AEC::InstanceType::R6idnMetal         then "r6idn.metal"
      when AEC::InstanceType::Inf2Xlarge         then "inf2.xlarge"
      when AEC::InstanceType::Inf28xlarge        then "inf2.8xlarge"
      when AEC::InstanceType::Inf224xlarge       then "inf2.24xlarge"
      when AEC::InstanceType::Inf248xlarge       then "inf2.48xlarge"
      when AEC::InstanceType::Trn1n32xlarge      then "trn1n.32xlarge"
      when AEC::InstanceType::I4gLarge           then "i4g.large"
      when AEC::InstanceType::I4gXlarge          then "i4g.xlarge"
      when AEC::InstanceType::I4g2xlarge         then "i4g.2xlarge"
      when AEC::InstanceType::I4g4xlarge         then "i4g.4xlarge"
      when AEC::InstanceType::I4g8xlarge         then "i4g.8xlarge"
      when AEC::InstanceType::I4g16xlarge        then "i4g.16xlarge"
      when AEC::InstanceType::Hpc7g4xlarge       then "hpc7g.4xlarge"
      when AEC::InstanceType::Hpc7g8xlarge       then "hpc7g.8xlarge"
      when AEC::InstanceType::Hpc7g16xlarge      then "hpc7g.16xlarge"
      when AEC::InstanceType::C7gnMedium         then "c7gn.medium"
      when AEC::InstanceType::C7gnLarge          then "c7gn.large"
      when AEC::InstanceType::C7gnXlarge         then "c7gn.xlarge"
      when AEC::InstanceType::C7gn2xlarge        then "c7gn.2xlarge"
      when AEC::InstanceType::C7gn4xlarge        then "c7gn.4xlarge"
      when AEC::InstanceType::C7gn8xlarge        then "c7gn.8xlarge"
      when AEC::InstanceType::C7gn12xlarge       then "c7gn.12xlarge"
      when AEC::InstanceType::C7gn16xlarge       then "c7gn.16xlarge"
      when AEC::InstanceType::P548xlarge         then "p5.48xlarge"
      when AEC::InstanceType::M7iLarge           then "m7i.large"
      when AEC::InstanceType::M7iXlarge          then "m7i.xlarge"
      when AEC::InstanceType::M7i2xlarge         then "m7i.2xlarge"
      when AEC::InstanceType::M7i4xlarge         then "m7i.4xlarge"
      when AEC::InstanceType::M7i8xlarge         then "m7i.8xlarge"
      when AEC::InstanceType::M7i12xlarge        then "m7i.12xlarge"
      when AEC::InstanceType::M7i16xlarge        then "m7i.16xlarge"
      when AEC::InstanceType::M7i24xlarge        then "m7i.24xlarge"
      when AEC::InstanceType::M7i48xlarge        then "m7i.48xlarge"
      when AEC::InstanceType::M7iFlexLarge       then "m7i-flex.large"
      when AEC::InstanceType::M7iFlexXlarge      then "m7i-flex.xlarge"
      when AEC::InstanceType::M7iFlex2xlarge     then "m7i-flex.2xlarge"
      when AEC::InstanceType::M7iFlex4xlarge     then "m7i-flex.4xlarge"
      when AEC::InstanceType::M7iFlex8xlarge     then "m7i-flex.8xlarge"
      when AEC::InstanceType::M7aMedium          then "m7a.medium"
      when AEC::InstanceType::M7aLarge           then "m7a.large"
      when AEC::InstanceType::M7aXlarge          then "m7a.xlarge"
      when AEC::InstanceType::M7a2xlarge         then "m7a.2xlarge"
      when AEC::InstanceType::M7a4xlarge         then "m7a.4xlarge"
      when AEC::InstanceType::M7a8xlarge         then "m7a.8xlarge"
      when AEC::InstanceType::M7a12xlarge        then "m7a.12xlarge"
      when AEC::InstanceType::M7a16xlarge        then "m7a.16xlarge"
      when AEC::InstanceType::M7a24xlarge        then "m7a.24xlarge"
      when AEC::InstanceType::M7a32xlarge        then "m7a.32xlarge"
      when AEC::InstanceType::M7a48xlarge        then "m7a.48xlarge"
      when AEC::InstanceType::M7aMetal48xl       then "m7a.metal-48xl"
      when AEC::InstanceType::Hpc7a12xlarge      then "hpc7a.12xlarge"
      when AEC::InstanceType::Hpc7a24xlarge      then "hpc7a.24xlarge"
      when AEC::InstanceType::Hpc7a48xlarge      then "hpc7a.48xlarge"
      when AEC::InstanceType::Hpc7a96xlarge      then "hpc7a.96xlarge"
      when AEC::InstanceType::C7gdMedium         then "c7gd.medium"
      when AEC::InstanceType::C7gdLarge          then "c7gd.large"
      when AEC::InstanceType::C7gdXlarge         then "c7gd.xlarge"
      when AEC::InstanceType::C7gd2xlarge        then "c7gd.2xlarge"
      when AEC::InstanceType::C7gd4xlarge        then "c7gd.4xlarge"
      when AEC::InstanceType::C7gd8xlarge        then "c7gd.8xlarge"
      when AEC::InstanceType::C7gd12xlarge       then "c7gd.12xlarge"
      when AEC::InstanceType::C7gd16xlarge       then "c7gd.16xlarge"
      when AEC::InstanceType::M7gdMedium         then "m7gd.medium"
      when AEC::InstanceType::M7gdLarge          then "m7gd.large"
      when AEC::InstanceType::M7gdXlarge         then "m7gd.xlarge"
      when AEC::InstanceType::M7gd2xlarge        then "m7gd.2xlarge"
      when AEC::InstanceType::M7gd4xlarge        then "m7gd.4xlarge"
      when AEC::InstanceType::M7gd8xlarge        then "m7gd.8xlarge"
      when AEC::InstanceType::M7gd12xlarge       then "m7gd.12xlarge"
      when AEC::InstanceType::M7gd16xlarge       then "m7gd.16xlarge"
      when AEC::InstanceType::R7gdMedium         then "r7gd.medium"
      when AEC::InstanceType::R7gdLarge          then "r7gd.large"
      when AEC::InstanceType::R7gdXlarge         then "r7gd.xlarge"
      when AEC::InstanceType::R7gd2xlarge        then "r7gd.2xlarge"
      when AEC::InstanceType::R7gd4xlarge        then "r7gd.4xlarge"
      when AEC::InstanceType::R7gd8xlarge        then "r7gd.8xlarge"
      when AEC::InstanceType::R7gd12xlarge       then "r7gd.12xlarge"
      when AEC::InstanceType::R7gd16xlarge       then "r7gd.16xlarge"
      when AEC::InstanceType::R7aMedium          then "r7a.medium"
      when AEC::InstanceType::R7aLarge           then "r7a.large"
      when AEC::InstanceType::R7aXlarge          then "r7a.xlarge"
      when AEC::InstanceType::R7a2xlarge         then "r7a.2xlarge"
      when AEC::InstanceType::R7a4xlarge         then "r7a.4xlarge"
      when AEC::InstanceType::R7a8xlarge         then "r7a.8xlarge"
      when AEC::InstanceType::R7a12xlarge        then "r7a.12xlarge"
      when AEC::InstanceType::R7a16xlarge        then "r7a.16xlarge"
      when AEC::InstanceType::R7a24xlarge        then "r7a.24xlarge"
      when AEC::InstanceType::R7a32xlarge        then "r7a.32xlarge"
      when AEC::InstanceType::R7a48xlarge        then "r7a.48xlarge"
      when AEC::InstanceType::C7iLarge           then "c7i.large"
      when AEC::InstanceType::C7iXlarge          then "c7i.xlarge"
      when AEC::InstanceType::C7i2xlarge         then "c7i.2xlarge"
      when AEC::InstanceType::C7i4xlarge         then "c7i.4xlarge"
      when AEC::InstanceType::C7i8xlarge         then "c7i.8xlarge"
      when AEC::InstanceType::C7i12xlarge        then "c7i.12xlarge"
      when AEC::InstanceType::C7i16xlarge        then "c7i.16xlarge"
      when AEC::InstanceType::C7i24xlarge        then "c7i.24xlarge"
      when AEC::InstanceType::C7i48xlarge        then "c7i.48xlarge"
      when AEC::InstanceType::Mac2M2proMetal     then "mac2-m2pro.metal"
      when AEC::InstanceType::R7izLarge          then "r7iz.large"
      when AEC::InstanceType::R7izXlarge         then "r7iz.xlarge"
      when AEC::InstanceType::R7iz2xlarge        then "r7iz.2xlarge"
      when AEC::InstanceType::R7iz4xlarge        then "r7iz.4xlarge"
      when AEC::InstanceType::R7iz8xlarge        then "r7iz.8xlarge"
      when AEC::InstanceType::R7iz12xlarge       then "r7iz.12xlarge"
      when AEC::InstanceType::R7iz16xlarge       then "r7iz.16xlarge"
      when AEC::InstanceType::R7iz32xlarge       then "r7iz.32xlarge"
      when AEC::InstanceType::C7aMedium          then "c7a.medium"
      when AEC::InstanceType::C7aLarge           then "c7a.large"
      when AEC::InstanceType::C7aXlarge          then "c7a.xlarge"
      when AEC::InstanceType::C7a2xlarge         then "c7a.2xlarge"
      when AEC::InstanceType::C7a4xlarge         then "c7a.4xlarge"
      when AEC::InstanceType::C7a8xlarge         then "c7a.8xlarge"
      when AEC::InstanceType::C7a12xlarge        then "c7a.12xlarge"
      when AEC::InstanceType::C7a16xlarge        then "c7a.16xlarge"
      when AEC::InstanceType::C7a24xlarge        then "c7a.24xlarge"
      when AEC::InstanceType::C7a32xlarge        then "c7a.32xlarge"
      when AEC::InstanceType::C7a48xlarge        then "c7a.48xlarge"
      when AEC::InstanceType::C7aMetal48xl       then "c7a.metal-48xl"
      when AEC::InstanceType::R7aMetal48xl       then "r7a.metal-48xl"
      when AEC::InstanceType::R7iLarge           then "r7i.large"
      when AEC::InstanceType::R7iXlarge          then "r7i.xlarge"
      when AEC::InstanceType::R7i2xlarge         then "r7i.2xlarge"
      when AEC::InstanceType::R7i4xlarge         then "r7i.4xlarge"
      when AEC::InstanceType::R7i8xlarge         then "r7i.8xlarge"
      when AEC::InstanceType::R7i12xlarge        then "r7i.12xlarge"
      when AEC::InstanceType::R7i16xlarge        then "r7i.16xlarge"
      when AEC::InstanceType::R7i24xlarge        then "r7i.24xlarge"
      when AEC::InstanceType::R7i48xlarge        then "r7i.48xlarge"
      when AEC::InstanceType::Dl2q24xlarge       then "dl2q.24xlarge"
      when AEC::InstanceType::Mac2M2Metal        then "mac2-m2.metal"
      when AEC::InstanceType::I4i12xlarge        then "i4i.12xlarge"
      when AEC::InstanceType::I4i24xlarge        then "i4i.24xlarge"
      when AEC::InstanceType::C7iMetal24xl       then "c7i.metal-24xl"
      when AEC::InstanceType::C7iMetal48xl       then "c7i.metal-48xl"
      when AEC::InstanceType::M7iMetal24xl       then "m7i.metal-24xl"
      when AEC::InstanceType::M7iMetal48xl       then "m7i.metal-48xl"
      when AEC::InstanceType::R7iMetal24xl       then "r7i.metal-24xl"
      when AEC::InstanceType::R7iMetal48xl       then "r7i.metal-48xl"
      when AEC::InstanceType::R7izMetal16xl      then "r7iz.metal-16xl"
      when AEC::InstanceType::R7izMetal32xl      then "r7iz.metal-32xl"
      when AEC::InstanceType::C7gdMetal          then "c7gd.metal"
      when AEC::InstanceType::M7gdMetal          then "m7gd.metal"
      when AEC::InstanceType::R7gdMetal          then "r7gd.metal"
      when AEC::InstanceType::G6Xlarge           then "g6.xlarge"
      when AEC::InstanceType::G62xlarge          then "g6.2xlarge"
      when AEC::InstanceType::G64xlarge          then "g6.4xlarge"
      when AEC::InstanceType::G68xlarge          then "g6.8xlarge"
      when AEC::InstanceType::G612xlarge         then "g6.12xlarge"
      when AEC::InstanceType::G616xlarge         then "g6.16xlarge"
      when AEC::InstanceType::G624xlarge         then "g6.24xlarge"
      when AEC::InstanceType::G648xlarge         then "g6.48xlarge"
      when AEC::InstanceType::Gr64xlarge         then "gr6.4xlarge"
      when AEC::InstanceType::Gr68xlarge         then "gr6.8xlarge"
      when AEC::InstanceType::C7iFlexLarge       then "c7i-flex.large"
      when AEC::InstanceType::C7iFlexXlarge      then "c7i-flex.xlarge"
      when AEC::InstanceType::C7iFlex2xlarge     then "c7i-flex.2xlarge"
      when AEC::InstanceType::C7iFlex4xlarge     then "c7i-flex.4xlarge"
      when AEC::InstanceType::C7iFlex8xlarge     then "c7i-flex.8xlarge"
      when AEC::InstanceType::U7i12tb224xlarge   then "u7i-12tb.224xlarge"
      when AEC::InstanceType::U7in16tb224xlarge  then "u7in-16tb.224xlarge"
      when AEC::InstanceType::U7in24tb224xlarge  then "u7in-24tb.224xlarge"
      when AEC::InstanceType::U7in32tb224xlarge  then "u7in-32tb.224xlarge"
      when AEC::InstanceType::U7ib12tb224xlarge  then "u7ib-12tb.224xlarge"
      when AEC::InstanceType::C7gnMetal          then "c7gn.metal"
      when AEC::InstanceType::R8gMedium          then "r8g.medium"
      when AEC::InstanceType::R8gLarge           then "r8g.large"
      when AEC::InstanceType::R8gXlarge          then "r8g.xlarge"
      when AEC::InstanceType::R8g2xlarge         then "r8g.2xlarge"
      when AEC::InstanceType::R8g4xlarge         then "r8g.4xlarge"
      when AEC::InstanceType::R8g8xlarge         then "r8g.8xlarge"
      when AEC::InstanceType::R8g12xlarge        then "r8g.12xlarge"
      when AEC::InstanceType::R8g16xlarge        then "r8g.16xlarge"
      when AEC::InstanceType::R8g24xlarge        then "r8g.24xlarge"
      when AEC::InstanceType::R8g48xlarge        then "r8g.48xlarge"
      when AEC::InstanceType::R8gMetal24xl       then "r8g.metal-24xl"
      when AEC::InstanceType::R8gMetal48xl       then "r8g.metal-48xl"
      when AEC::InstanceType::Mac2M1ultraMetal   then "mac2-m1ultra.metal"
      when AEC::InstanceType::G6eXlarge          then "g6e.xlarge"
      when AEC::InstanceType::G6e2xlarge         then "g6e.2xlarge"
      when AEC::InstanceType::G6e4xlarge         then "g6e.4xlarge"
      when AEC::InstanceType::G6e8xlarge         then "g6e.8xlarge"
      when AEC::InstanceType::G6e12xlarge        then "g6e.12xlarge"
      when AEC::InstanceType::G6e16xlarge        then "g6e.16xlarge"
      when AEC::InstanceType::G6e24xlarge        then "g6e.24xlarge"
      when AEC::InstanceType::G6e48xlarge        then "g6e.48xlarge"
      when AEC::InstanceType::C8gMedium          then "c8g.medium"
      when AEC::InstanceType::C8gLarge           then "c8g.large"
      when AEC::InstanceType::C8gXlarge          then "c8g.xlarge"
      when AEC::InstanceType::C8g2xlarge         then "c8g.2xlarge"
      when AEC::InstanceType::C8g4xlarge         then "c8g.4xlarge"
      when AEC::InstanceType::C8g8xlarge         then "c8g.8xlarge"
      when AEC::InstanceType::C8g12xlarge        then "c8g.12xlarge"
      when AEC::InstanceType::C8g16xlarge        then "c8g.16xlarge"
      when AEC::InstanceType::C8g24xlarge        then "c8g.24xlarge"
      when AEC::InstanceType::C8g48xlarge        then "c8g.48xlarge"
      when AEC::InstanceType::C8gMetal24xl       then "c8g.metal-24xl"
      when AEC::InstanceType::C8gMetal48xl       then "c8g.metal-48xl"
      when AEC::InstanceType::M8gMedium          then "m8g.medium"
      when AEC::InstanceType::M8gLarge           then "m8g.large"
      when AEC::InstanceType::M8gXlarge          then "m8g.xlarge"
      when AEC::InstanceType::M8g2xlarge         then "m8g.2xlarge"
      when AEC::InstanceType::M8g4xlarge         then "m8g.4xlarge"
      when AEC::InstanceType::M8g8xlarge         then "m8g.8xlarge"
      when AEC::InstanceType::M8g12xlarge        then "m8g.12xlarge"
      when AEC::InstanceType::M8g16xlarge        then "m8g.16xlarge"
      when AEC::InstanceType::M8g24xlarge        then "m8g.24xlarge"
      when AEC::InstanceType::M8g48xlarge        then "m8g.48xlarge"
      when AEC::InstanceType::M8gMetal24xl       then "m8g.metal-24xl"
      when AEC::InstanceType::M8gMetal48xl       then "m8g.metal-48xl"
      when AEC::InstanceType::X8gMedium          then "x8g.medium"
      when AEC::InstanceType::X8gLarge           then "x8g.large"
      when AEC::InstanceType::X8gXlarge          then "x8g.xlarge"
      when AEC::InstanceType::X8g2xlarge         then "x8g.2xlarge"
      when AEC::InstanceType::X8g4xlarge         then "x8g.4xlarge"
      when AEC::InstanceType::X8g8xlarge         then "x8g.8xlarge"
      when AEC::InstanceType::X8g12xlarge        then "x8g.12xlarge"
      when AEC::InstanceType::X8g16xlarge        then "x8g.16xlarge"
      when AEC::InstanceType::X8g24xlarge        then "x8g.24xlarge"
      when AEC::InstanceType::X8g48xlarge        then "x8g.48xlarge"
      when AEC::InstanceType::X8gMetal24xl       then "x8g.metal-24xl"
      when AEC::InstanceType::X8gMetal48xl       then "x8g.metal-48xl"
      when AEC::InstanceType::I7ieLarge          then "i7ie.large"
      when AEC::InstanceType::I7ieXlarge         then "i7ie.xlarge"
      when AEC::InstanceType::I7ie2xlarge        then "i7ie.2xlarge"
      when AEC::InstanceType::I7ie3xlarge        then "i7ie.3xlarge"
      when AEC::InstanceType::I7ie6xlarge        then "i7ie.6xlarge"
      when AEC::InstanceType::I7ie12xlarge       then "i7ie.12xlarge"
      when AEC::InstanceType::I7ie18xlarge       then "i7ie.18xlarge"
      when AEC::InstanceType::I7ie24xlarge       then "i7ie.24xlarge"
      when AEC::InstanceType::I7ie48xlarge       then "i7ie.48xlarge"
      when AEC::InstanceType::I8gLarge           then "i8g.large"
      when AEC::InstanceType::I8gXlarge          then "i8g.xlarge"
      when AEC::InstanceType::I8g2xlarge         then "i8g.2xlarge"
      when AEC::InstanceType::I8g4xlarge         then "i8g.4xlarge"
      when AEC::InstanceType::I8g8xlarge         then "i8g.8xlarge"
      when AEC::InstanceType::I8g12xlarge        then "i8g.12xlarge"
      when AEC::InstanceType::I8g16xlarge        then "i8g.16xlarge"
      when AEC::InstanceType::I8g24xlarge        then "i8g.24xlarge"
      when AEC::InstanceType::I8gMetal24xl       then "i8g.metal-24xl"
      when AEC::InstanceType::U7i6tb112xlarge    then "u7i-6tb.112xlarge"
      when AEC::InstanceType::U7i8tb112xlarge    then "u7i-8tb.112xlarge"
      when AEC::InstanceType::U7inh32tb480xlarge then "u7inh-32tb.480xlarge"
      when AEC::InstanceType::P5e48xlarge        then "p5e.48xlarge"
      when AEC::InstanceType::P5en48xlarge       then "p5en.48xlarge"
      when AEC::InstanceType::F212xlarge         then "f2.12xlarge"
      when AEC::InstanceType::F248xlarge         then "f2.48xlarge"
      when AEC::InstanceType::Trn248xlarge       then "trn2.48xlarge"
      when AEC::InstanceType::C7iFlex12xlarge    then "c7i-flex.12xlarge"
      when AEC::InstanceType::C7iFlex16xlarge    then "c7i-flex.16xlarge"
      when AEC::InstanceType::M7iFlex12xlarge    then "m7i-flex.12xlarge"
      when AEC::InstanceType::M7iFlex16xlarge    then "m7i-flex.16xlarge"
      when AEC::InstanceType::I7ieMetal24xl      then "i7ie.metal-24xl"
      when AEC::InstanceType::I7ieMetal48xl      then "i7ie.metal-48xl"
      when AEC::InstanceType::I8g48xlarge        then "i8g.48xlarge"
      when AEC::InstanceType::C8gdMedium         then "c8gd.medium"
      when AEC::InstanceType::C8gdLarge          then "c8gd.large"
      when AEC::InstanceType::C8gdXlarge         then "c8gd.xlarge"
      when AEC::InstanceType::C8gd2xlarge        then "c8gd.2xlarge"
      when AEC::InstanceType::C8gd4xlarge        then "c8gd.4xlarge"
      when AEC::InstanceType::C8gd8xlarge        then "c8gd.8xlarge"
      when AEC::InstanceType::C8gd12xlarge       then "c8gd.12xlarge"
      when AEC::InstanceType::C8gd16xlarge       then "c8gd.16xlarge"
      when AEC::InstanceType::C8gd24xlarge       then "c8gd.24xlarge"
      when AEC::InstanceType::C8gd48xlarge       then "c8gd.48xlarge"
      when AEC::InstanceType::C8gdMetal24xl      then "c8gd.metal-24xl"
      when AEC::InstanceType::C8gdMetal48xl      then "c8gd.metal-48xl"
      when AEC::InstanceType::I7iLarge           then "i7i.large"
      when AEC::InstanceType::I7iXlarge          then "i7i.xlarge"
      when AEC::InstanceType::I7i2xlarge         then "i7i.2xlarge"
      when AEC::InstanceType::I7i4xlarge         then "i7i.4xlarge"
      when AEC::InstanceType::I7i8xlarge         then "i7i.8xlarge"
      when AEC::InstanceType::I7i12xlarge        then "i7i.12xlarge"
      when AEC::InstanceType::I7i16xlarge        then "i7i.16xlarge"
      when AEC::InstanceType::I7i24xlarge        then "i7i.24xlarge"
      when AEC::InstanceType::I7i48xlarge        then "i7i.48xlarge"
      when AEC::InstanceType::I7iMetal24xl       then "i7i.metal-24xl"
      when AEC::InstanceType::I7iMetal48xl       then "i7i.metal-48xl"
      when AEC::InstanceType::P6B20048xlarge     then "p6-b200.48xlarge"
      when AEC::InstanceType::M8gdMedium         then "m8gd.medium"
      when AEC::InstanceType::M8gdLarge          then "m8gd.large"
      when AEC::InstanceType::M8gdXlarge         then "m8gd.xlarge"
      when AEC::InstanceType::M8gd2xlarge        then "m8gd.2xlarge"
      when AEC::InstanceType::M8gd4xlarge        then "m8gd.4xlarge"
      when AEC::InstanceType::M8gd8xlarge        then "m8gd.8xlarge"
      when AEC::InstanceType::M8gd12xlarge       then "m8gd.12xlarge"
      when AEC::InstanceType::M8gd16xlarge       then "m8gd.16xlarge"
      when AEC::InstanceType::M8gd24xlarge       then "m8gd.24xlarge"
      when AEC::InstanceType::M8gd48xlarge       then "m8gd.48xlarge"
      when AEC::InstanceType::M8gdMetal24xl      then "m8gd.metal-24xl"
      when AEC::InstanceType::M8gdMetal48xl      then "m8gd.metal-48xl"
      when AEC::InstanceType::R8gdMedium         then "r8gd.medium"
      when AEC::InstanceType::R8gdLarge          then "r8gd.large"
      when AEC::InstanceType::R8gdXlarge         then "r8gd.xlarge"
      when AEC::InstanceType::R8gd2xlarge        then "r8gd.2xlarge"
      when AEC::InstanceType::R8gd4xlarge        then "r8gd.4xlarge"
      when AEC::InstanceType::R8gd8xlarge        then "r8gd.8xlarge"
      when AEC::InstanceType::R8gd12xlarge       then "r8gd.12xlarge"
      when AEC::InstanceType::R8gd16xlarge       then "r8gd.16xlarge"
      when AEC::InstanceType::R8gd24xlarge       then "r8gd.24xlarge"
      when AEC::InstanceType::R8gd48xlarge       then "r8gd.48xlarge"
      when AEC::InstanceType::R8gdMetal24xl      then "r8gd.metal-24xl"
      when AEC::InstanceType::R8gdMetal48xl      then "r8gd.metal-48xl"
      when AEC::InstanceType::C8gnMedium         then "c8gn.medium"
      when AEC::InstanceType::C8gnLarge          then "c8gn.large"
      when AEC::InstanceType::C8gnXlarge         then "c8gn.xlarge"
      when AEC::InstanceType::C8gn2xlarge        then "c8gn.2xlarge"
      when AEC::InstanceType::C8gn4xlarge        then "c8gn.4xlarge"
      when AEC::InstanceType::C8gn8xlarge        then "c8gn.8xlarge"
      when AEC::InstanceType::C8gn12xlarge       then "c8gn.12xlarge"
      when AEC::InstanceType::C8gn16xlarge       then "c8gn.16xlarge"
      when AEC::InstanceType::C8gn24xlarge       then "c8gn.24xlarge"
      when AEC::InstanceType::C8gn48xlarge       then "c8gn.48xlarge"
      when AEC::InstanceType::C8gnMetal24xl      then "c8gn.metal-24xl"
      when AEC::InstanceType::C8gnMetal48xl      then "c8gn.metal-48xl"
      when AEC::InstanceType::F26xlarge          then "f2.6xlarge"
      when AEC::InstanceType::P6eGb20036xlarge   then "p6e-gb200.36xlarge"
      when AEC::InstanceType::G6fLarge           then "g6f.large"
      when AEC::InstanceType::G6fXlarge          then "g6f.xlarge"
      when AEC::InstanceType::G6f2xlarge         then "g6f.2xlarge"
      when AEC::InstanceType::G6f4xlarge         then "g6f.4xlarge"
      when AEC::InstanceType::Gr6f4xlarge        then "gr6f.4xlarge"
      when AEC::InstanceType::P54xlarge          then "p5.4xlarge"
      when AEC::InstanceType::R8iLarge           then "r8i.large"
      when AEC::InstanceType::R8iXlarge          then "r8i.xlarge"
      when AEC::InstanceType::R8i2xlarge         then "r8i.2xlarge"
      when AEC::InstanceType::R8i4xlarge         then "r8i.4xlarge"
      when AEC::InstanceType::R8i8xlarge         then "r8i.8xlarge"
      when AEC::InstanceType::R8i12xlarge        then "r8i.12xlarge"
      when AEC::InstanceType::R8i16xlarge        then "r8i.16xlarge"
      when AEC::InstanceType::R8i24xlarge        then "r8i.24xlarge"
      when AEC::InstanceType::R8i32xlarge        then "r8i.32xlarge"
      when AEC::InstanceType::R8i48xlarge        then "r8i.48xlarge"
      when AEC::InstanceType::R8i96xlarge        then "r8i.96xlarge"
      when AEC::InstanceType::R8iMetal48xl       then "r8i.metal-48xl"
      when AEC::InstanceType::R8iMetal96xl       then "r8i.metal-96xl"
      when AEC::InstanceType::R8iFlexLarge       then "r8i-flex.large"
      when AEC::InstanceType::R8iFlexXlarge      then "r8i-flex.xlarge"
      when AEC::InstanceType::R8iFlex2xlarge     then "r8i-flex.2xlarge"
      when AEC::InstanceType::R8iFlex4xlarge     then "r8i-flex.4xlarge"
      when AEC::InstanceType::R8iFlex8xlarge     then "r8i-flex.8xlarge"
      when AEC::InstanceType::R8iFlex12xlarge    then "r8i-flex.12xlarge"
      when AEC::InstanceType::R8iFlex16xlarge    then "r8i-flex.16xlarge"
      when AEC::InstanceType::M8iLarge           then "m8i.large"
      when AEC::InstanceType::M8iXlarge          then "m8i.xlarge"
      when AEC::InstanceType::M8i2xlarge         then "m8i.2xlarge"
      when AEC::InstanceType::M8i4xlarge         then "m8i.4xlarge"
      when AEC::InstanceType::M8i8xlarge         then "m8i.8xlarge"
      when AEC::InstanceType::M8i12xlarge        then "m8i.12xlarge"
      when AEC::InstanceType::M8i16xlarge        then "m8i.16xlarge"
      when AEC::InstanceType::M8i24xlarge        then "m8i.24xlarge"
      when AEC::InstanceType::M8i32xlarge        then "m8i.32xlarge"
      when AEC::InstanceType::M8i48xlarge        then "m8i.48xlarge"
      when AEC::InstanceType::M8i96xlarge        then "m8i.96xlarge"
      when AEC::InstanceType::M8iMetal48xl       then "m8i.metal-48xl"
      when AEC::InstanceType::M8iMetal96xl       then "m8i.metal-96xl"
      when AEC::InstanceType::M8iFlexLarge       then "m8i-flex.large"
      when AEC::InstanceType::M8iFlexXlarge      then "m8i-flex.xlarge"
      when AEC::InstanceType::M8iFlex2xlarge     then "m8i-flex.2xlarge"
      when AEC::InstanceType::M8iFlex4xlarge     then "m8i-flex.4xlarge"
      when AEC::InstanceType::M8iFlex8xlarge     then "m8i-flex.8xlarge"
      when AEC::InstanceType::M8iFlex12xlarge    then "m8i-flex.12xlarge"
      when AEC::InstanceType::M8iFlex16xlarge    then "m8i-flex.16xlarge"
      when AEC::InstanceType::I8geLarge          then "i8ge.large"
      when AEC::InstanceType::I8geXlarge         then "i8ge.xlarge"
      when AEC::InstanceType::I8ge2xlarge        then "i8ge.2xlarge"
      when AEC::InstanceType::I8ge3xlarge        then "i8ge.3xlarge"
      when AEC::InstanceType::I8ge6xlarge        then "i8ge.6xlarge"
      when AEC::InstanceType::I8ge12xlarge       then "i8ge.12xlarge"
      when AEC::InstanceType::I8ge18xlarge       then "i8ge.18xlarge"
      when AEC::InstanceType::I8ge24xlarge       then "i8ge.24xlarge"
      when AEC::InstanceType::I8ge48xlarge       then "i8ge.48xlarge"
      when AEC::InstanceType::I8geMetal24xl      then "i8ge.metal-24xl"
      when AEC::InstanceType::I8geMetal48xl      then "i8ge.metal-48xl"
      when AEC::InstanceType::MacM4Metal         then "mac-m4.metal"
      when AEC::InstanceType::MacM4proMetal      then "mac-m4pro.metal"
      when AEC::InstanceType::R8gnMedium         then "r8gn.medium"
      when AEC::InstanceType::R8gnLarge          then "r8gn.large"
      when AEC::InstanceType::R8gnXlarge         then "r8gn.xlarge"
      when AEC::InstanceType::R8gn2xlarge        then "r8gn.2xlarge"
      when AEC::InstanceType::R8gn4xlarge        then "r8gn.4xlarge"
      when AEC::InstanceType::R8gn8xlarge        then "r8gn.8xlarge"
      when AEC::InstanceType::R8gn12xlarge       then "r8gn.12xlarge"
      when AEC::InstanceType::R8gn16xlarge       then "r8gn.16xlarge"
      when AEC::InstanceType::R8gn24xlarge       then "r8gn.24xlarge"
      when AEC::InstanceType::R8gn48xlarge       then "r8gn.48xlarge"
      when AEC::InstanceType::R8gnMetal24xl      then "r8gn.metal-24xl"
      when AEC::InstanceType::R8gnMetal48xl      then "r8gn.metal-48xl"
      when AEC::InstanceType::C8iLarge           then "c8i.large"
      when AEC::InstanceType::C8iXlarge          then "c8i.xlarge"
      when AEC::InstanceType::C8i2xlarge         then "c8i.2xlarge"
      when AEC::InstanceType::C8i4xlarge         then "c8i.4xlarge"
      when AEC::InstanceType::C8i8xlarge         then "c8i.8xlarge"
      when AEC::InstanceType::C8i12xlarge        then "c8i.12xlarge"
      when AEC::InstanceType::C8i16xlarge        then "c8i.16xlarge"
      when AEC::InstanceType::C8i24xlarge        then "c8i.24xlarge"
      when AEC::InstanceType::C8i32xlarge        then "c8i.32xlarge"
      when AEC::InstanceType::C8i48xlarge        then "c8i.48xlarge"
      when AEC::InstanceType::C8i96xlarge        then "c8i.96xlarge"
      when AEC::InstanceType::C8iMetal48xl       then "c8i.metal-48xl"
      when AEC::InstanceType::C8iMetal96xl       then "c8i.metal-96xl"
      when AEC::InstanceType::C8iFlexLarge       then "c8i-flex.large"
      when AEC::InstanceType::C8iFlexXlarge      then "c8i-flex.xlarge"
      when AEC::InstanceType::C8iFlex2xlarge     then "c8i-flex.2xlarge"
      when AEC::InstanceType::C8iFlex4xlarge     then "c8i-flex.4xlarge"
      when AEC::InstanceType::C8iFlex8xlarge     then "c8i-flex.8xlarge"
      when AEC::InstanceType::C8iFlex12xlarge    then "c8i-flex.12xlarge"
      when AEC::InstanceType::C8iFlex16xlarge    then "c8i-flex.16xlarge"
      when AEC::InstanceType::R8gbMedium         then "r8gb.medium"
      when AEC::InstanceType::R8gbLarge          then "r8gb.large"
      when AEC::InstanceType::R8gbXlarge         then "r8gb.xlarge"
      when AEC::InstanceType::R8gb2xlarge        then "r8gb.2xlarge"
      when AEC::InstanceType::R8gb4xlarge        then "r8gb.4xlarge"
      when AEC::InstanceType::R8gb8xlarge        then "r8gb.8xlarge"
      when AEC::InstanceType::R8gb12xlarge       then "r8gb.12xlarge"
      when AEC::InstanceType::R8gb16xlarge       then "r8gb.16xlarge"
      when AEC::InstanceType::R8gb24xlarge       then "r8gb.24xlarge"
      when AEC::InstanceType::R8gbMetal24xl      then "r8gb.metal-24xl"
      when AEC::InstanceType::M8aMedium          then "m8a.medium"
      when AEC::InstanceType::M8aLarge           then "m8a.large"
      when AEC::InstanceType::M8aXlarge          then "m8a.xlarge"
      when AEC::InstanceType::M8a2xlarge         then "m8a.2xlarge"
      when AEC::InstanceType::M8a4xlarge         then "m8a.4xlarge"
      when AEC::InstanceType::M8a8xlarge         then "m8a.8xlarge"
      when AEC::InstanceType::M8a12xlarge        then "m8a.12xlarge"
      when AEC::InstanceType::M8a16xlarge        then "m8a.16xlarge"
      when AEC::InstanceType::M8a24xlarge        then "m8a.24xlarge"
      when AEC::InstanceType::M8a48xlarge        then "m8a.48xlarge"
      when AEC::InstanceType::M8aMetal24xl       then "m8a.metal-24xl"
      when AEC::InstanceType::M8aMetal48xl       then "m8a.metal-48xl"
      when AEC::InstanceType::Trn23xlarge        then "trn2.3xlarge"
      when AEC::InstanceType::R8aMedium          then "r8a.medium"
      when AEC::InstanceType::R8aLarge           then "r8a.large"
      when AEC::InstanceType::R8aXlarge          then "r8a.xlarge"
      when AEC::InstanceType::R8a2xlarge         then "r8a.2xlarge"
      when AEC::InstanceType::R8a4xlarge         then "r8a.4xlarge"
      when AEC::InstanceType::R8a8xlarge         then "r8a.8xlarge"
      when AEC::InstanceType::R8a12xlarge        then "r8a.12xlarge"
      when AEC::InstanceType::R8a16xlarge        then "r8a.16xlarge"
      when AEC::InstanceType::R8a24xlarge        then "r8a.24xlarge"
      when AEC::InstanceType::R8a48xlarge        then "r8a.48xlarge"
      when AEC::InstanceType::R8aMetal24xl       then "r8a.metal-24xl"
      when AEC::InstanceType::R8aMetal48xl       then "r8a.metal-48xl"
      when AEC::InstanceType::P6B30048xlarge     then "p6-b300.48xlarge"
      when AEC::InstanceType::C8aMedium          then "c8a.medium"
      when AEC::InstanceType::C8aLarge           then "c8a.large"
      when AEC::InstanceType::C8aXlarge          then "c8a.xlarge"
      when AEC::InstanceType::C8a2xlarge         then "c8a.2xlarge"
      when AEC::InstanceType::C8a4xlarge         then "c8a.4xlarge"
      when AEC::InstanceType::C8a8xlarge         then "c8a.8xlarge"
      when AEC::InstanceType::C8a12xlarge        then "c8a.12xlarge"
      when AEC::InstanceType::C8a16xlarge        then "c8a.16xlarge"
      when AEC::InstanceType::C8a24xlarge        then "c8a.24xlarge"
      when AEC::InstanceType::C8a48xlarge        then "c8a.48xlarge"
      when AEC::InstanceType::C8aMetal24xl       then "c8a.metal-24xl"
      when AEC::InstanceType::C8aMetal48xl       then "c8a.metal-48xl"
      when AEC::InstanceType::C8gb12xlarge       then "c8gb.12xlarge"
      when AEC::InstanceType::C8gb16xlarge       then "c8gb.16xlarge"
      when AEC::InstanceType::C8gb24xlarge       then "c8gb.24xlarge"
      when AEC::InstanceType::C8gb2xlarge        then "c8gb.2xlarge"
      when AEC::InstanceType::C8gb4xlarge        then "c8gb.4xlarge"
      when AEC::InstanceType::C8gb8xlarge        then "c8gb.8xlarge"
      when AEC::InstanceType::C8gbLarge          then "c8gb.large"
      when AEC::InstanceType::C8gbMedium         then "c8gb.medium"
      when AEC::InstanceType::C8gbMetal24xl      then "c8gb.metal-24xl"
      when AEC::InstanceType::C8gbXlarge         then "c8gb.xlarge"
      when AEC::InstanceType::C8gb48xlarge       then "c8gb.48xlarge"
      when AEC::InstanceType::C8gbMetal48xl      then "c8gb.metal-48xl"
      when AEC::InstanceType::M8gb12xlarge       then "m8gb.12xlarge"
      when AEC::InstanceType::M8gb16xlarge       then "m8gb.16xlarge"
      when AEC::InstanceType::M8gb24xlarge       then "m8gb.24xlarge"
      when AEC::InstanceType::M8gb2xlarge        then "m8gb.2xlarge"
      when AEC::InstanceType::M8gb4xlarge        then "m8gb.4xlarge"
      when AEC::InstanceType::M8gb8xlarge        then "m8gb.8xlarge"
      when AEC::InstanceType::M8gbLarge          then "m8gb.large"
      when AEC::InstanceType::M8gbMedium         then "m8gb.medium"
      when AEC::InstanceType::M8gbXlarge         then "m8gb.xlarge"
      when AEC::InstanceType::M8gb48xlarge       then "m8gb.48xlarge"
      when AEC::InstanceType::M8gbMetal24xl      then "m8gb.metal-24xl"
      when AEC::InstanceType::M8gbMetal48xl      then "m8gb.metal-48xl"
      when AEC::InstanceType::M8gn12xlarge       then "m8gn.12xlarge"
      when AEC::InstanceType::M8gn16xlarge       then "m8gn.16xlarge"
      when AEC::InstanceType::M8gn24xlarge       then "m8gn.24xlarge"
      when AEC::InstanceType::M8gn2xlarge        then "m8gn.2xlarge"
      when AEC::InstanceType::M8gn48xlarge       then "m8gn.48xlarge"
      when AEC::InstanceType::M8gn4xlarge        then "m8gn.4xlarge"
      when AEC::InstanceType::M8gn8xlarge        then "m8gn.8xlarge"
      when AEC::InstanceType::M8gnLarge          then "m8gn.large"
      when AEC::InstanceType::M8gnMedium         then "m8gn.medium"
      when AEC::InstanceType::M8gnXlarge         then "m8gn.xlarge"
      when AEC::InstanceType::M8gnMetal24xl      then "m8gn.metal-24xl"
      when AEC::InstanceType::M8gnMetal48xl      then "m8gn.metal-48xl"
      when AEC::InstanceType::X8aedz12xlarge     then "x8aedz.12xlarge"
      when AEC::InstanceType::X8aedz24xlarge     then "x8aedz.24xlarge"
      when AEC::InstanceType::X8aedz3xlarge      then "x8aedz.3xlarge"
      when AEC::InstanceType::X8aedz6xlarge      then "x8aedz.6xlarge"
      when AEC::InstanceType::X8aedzLarge        then "x8aedz.large"
      when AEC::InstanceType::X8aedzMetal12xl    then "x8aedz.metal-12xl"
      when AEC::InstanceType::X8aedzMetal24xl    then "x8aedz.metal-24xl"
      when AEC::InstanceType::X8aedzXlarge       then "x8aedz.xlarge"
      when AEC::InstanceType::M8aznMedium        then "m8azn.medium"
      when AEC::InstanceType::M8aznLarge         then "m8azn.large"
      when AEC::InstanceType::M8aznXlarge        then "m8azn.xlarge"
      when AEC::InstanceType::M8azn3xlarge       then "m8azn.3xlarge"
      when AEC::InstanceType::M8azn6xlarge       then "m8azn.6xlarge"
      when AEC::InstanceType::M8azn12xlarge      then "m8azn.12xlarge"
      when AEC::InstanceType::M8azn24xlarge      then "m8azn.24xlarge"
      when AEC::InstanceType::M8aznMetal12xl     then "m8azn.metal-12xl"
      when AEC::InstanceType::M8aznMetal24xl     then "m8azn.metal-24xl"
      when AEC::InstanceType::X8iLarge           then "x8i.large"
      when AEC::InstanceType::X8iXlarge          then "x8i.xlarge"
      when AEC::InstanceType::X8i2xlarge         then "x8i.2xlarge"
      when AEC::InstanceType::X8i4xlarge         then "x8i.4xlarge"
      when AEC::InstanceType::X8i8xlarge         then "x8i.8xlarge"
      when AEC::InstanceType::X8i12xlarge        then "x8i.12xlarge"
      when AEC::InstanceType::X8i16xlarge        then "x8i.16xlarge"
      when AEC::InstanceType::X8i24xlarge        then "x8i.24xlarge"
      when AEC::InstanceType::X8i32xlarge        then "x8i.32xlarge"
      when AEC::InstanceType::X8i48xlarge        then "x8i.48xlarge"
      when AEC::InstanceType::X8i64xlarge        then "x8i.64xlarge"
      when AEC::InstanceType::X8i96xlarge        then "x8i.96xlarge"
      when AEC::InstanceType::X8iMetal48xl       then "x8i.metal-48xl"
      when AEC::InstanceType::X8iMetal96xl       then "x8i.metal-96xl"
      when AEC::InstanceType::MacM4maxMetal      then "mac-m4max.metal"
      when AEC::InstanceType::G7e2xlarge         then "g7e.2xlarge"
      when AEC::InstanceType::G7e4xlarge         then "g7e.4xlarge"
      when AEC::InstanceType::G7e8xlarge         then "g7e.8xlarge"
      when AEC::InstanceType::G7e12xlarge        then "g7e.12xlarge"
      when AEC::InstanceType::G7e24xlarge        then "g7e.24xlarge"
      when AEC::InstanceType::G7e48xlarge        then "g7e.48xlarge"
      when AEC::InstanceType::R8idLarge          then "r8id.large"
      when AEC::InstanceType::R8idXlarge         then "r8id.xlarge"
      when AEC::InstanceType::R8id2xlarge        then "r8id.2xlarge"
      when AEC::InstanceType::R8id4xlarge        then "r8id.4xlarge"
      when AEC::InstanceType::R8id8xlarge        then "r8id.8xlarge"
      when AEC::InstanceType::R8id12xlarge       then "r8id.12xlarge"
      when AEC::InstanceType::R8id16xlarge       then "r8id.16xlarge"
      when AEC::InstanceType::R8id24xlarge       then "r8id.24xlarge"
      when AEC::InstanceType::R8id32xlarge       then "r8id.32xlarge"
      when AEC::InstanceType::R8id48xlarge       then "r8id.48xlarge"
      when AEC::InstanceType::R8id96xlarge       then "r8id.96xlarge"
      when AEC::InstanceType::R8idMetal48xl      then "r8id.metal-48xl"
      when AEC::InstanceType::R8idMetal96xl      then "r8id.metal-96xl"
      when AEC::InstanceType::C8idLarge          then "c8id.large"
      when AEC::InstanceType::C8idXlarge         then "c8id.xlarge"
      when AEC::InstanceType::C8id2xlarge        then "c8id.2xlarge"
      when AEC::InstanceType::C8id4xlarge        then "c8id.4xlarge"
      when AEC::InstanceType::C8id8xlarge        then "c8id.8xlarge"
      when AEC::InstanceType::C8id12xlarge       then "c8id.12xlarge"
      when AEC::InstanceType::C8id16xlarge       then "c8id.16xlarge"
      when AEC::InstanceType::C8id24xlarge       then "c8id.24xlarge"
      when AEC::InstanceType::C8id32xlarge       then "c8id.32xlarge"
      when AEC::InstanceType::C8id48xlarge       then "c8id.48xlarge"
      when AEC::InstanceType::C8id96xlarge       then "c8id.96xlarge"
      when AEC::InstanceType::C8idMetal48xl      then "c8id.metal-48xl"
      when AEC::InstanceType::C8idMetal96xl      then "c8id.metal-96xl"
      when AEC::InstanceType::M8idLarge          then "m8id.large"
      when AEC::InstanceType::M8idXlarge         then "m8id.xlarge"
      when AEC::InstanceType::M8id2xlarge        then "m8id.2xlarge"
      when AEC::InstanceType::M8id4xlarge        then "m8id.4xlarge"
      when AEC::InstanceType::M8id8xlarge        then "m8id.8xlarge"
      when AEC::InstanceType::M8id12xlarge       then "m8id.12xlarge"
      when AEC::InstanceType::M8id16xlarge       then "m8id.16xlarge"
      when AEC::InstanceType::M8id24xlarge       then "m8id.24xlarge"
      when AEC::InstanceType::M8id32xlarge       then "m8id.32xlarge"
      when AEC::InstanceType::M8id48xlarge       then "m8id.48xlarge"
      when AEC::InstanceType::M8id96xlarge       then "m8id.96xlarge"
      when AEC::InstanceType::M8idMetal48xl      then "m8id.metal-48xl"
      when AEC::InstanceType::M8idMetal96xl      then "m8id.metal-96xl"
      when AEC::InstanceType::Hpc8a96xlarge      then "hpc8a.96xlarge"
      when AEC::InstanceType::C8inLarge          then "c8in.large"
      when AEC::InstanceType::C8inXlarge         then "c8in.xlarge"
      when AEC::InstanceType::C8in2xlarge        then "c8in.2xlarge"
      when AEC::InstanceType::C8in4xlarge        then "c8in.4xlarge"
      when AEC::InstanceType::C8in8xlarge        then "c8in.8xlarge"
      when AEC::InstanceType::C8in12xlarge       then "c8in.12xlarge"
      when AEC::InstanceType::C8in16xlarge       then "c8in.16xlarge"
      when AEC::InstanceType::C8in24xlarge       then "c8in.24xlarge"
      when AEC::InstanceType::C8in32xlarge       then "c8in.32xlarge"
      when AEC::InstanceType::C8in48xlarge       then "c8in.48xlarge"
      when AEC::InstanceType::C8in96xlarge       then "c8in.96xlarge"
      when AEC::InstanceType::C8inMetal48xl      then "c8in.metal-48xl"
      when AEC::InstanceType::C8inMetal96xl      then "c8in.metal-96xl"
      when AEC::InstanceType::C8ibLarge          then "c8ib.large"
      when AEC::InstanceType::C8ibXlarge         then "c8ib.xlarge"
      when AEC::InstanceType::C8ib2xlarge        then "c8ib.2xlarge"
      when AEC::InstanceType::C8ib4xlarge        then "c8ib.4xlarge"
      when AEC::InstanceType::C8ib8xlarge        then "c8ib.8xlarge"
      when AEC::InstanceType::C8ib12xlarge       then "c8ib.12xlarge"
      when AEC::InstanceType::C8ib16xlarge       then "c8ib.16xlarge"
      when AEC::InstanceType::C8ib24xlarge       then "c8ib.24xlarge"
      when AEC::InstanceType::C8ib32xlarge       then "c8ib.32xlarge"
      when AEC::InstanceType::C8ib48xlarge       then "c8ib.48xlarge"
      when AEC::InstanceType::C8ib96xlarge       then "c8ib.96xlarge"
      when AEC::InstanceType::C8ibMetal48xl      then "c8ib.metal-48xl"
      when AEC::InstanceType::C8ibMetal96xl      then "c8ib.metal-96xl"
      when AEC::InstanceType::R8inLarge          then "r8in.large"
      when AEC::InstanceType::R8inXlarge         then "r8in.xlarge"
      when AEC::InstanceType::R8in2xlarge        then "r8in.2xlarge"
      when AEC::InstanceType::R8in4xlarge        then "r8in.4xlarge"
      when AEC::InstanceType::R8in8xlarge        then "r8in.8xlarge"
      when AEC::InstanceType::R8in12xlarge       then "r8in.12xlarge"
      when AEC::InstanceType::R8in16xlarge       then "r8in.16xlarge"
      when AEC::InstanceType::R8in24xlarge       then "r8in.24xlarge"
      when AEC::InstanceType::R8in32xlarge       then "r8in.32xlarge"
      when AEC::InstanceType::R8in48xlarge       then "r8in.48xlarge"
      when AEC::InstanceType::R8in96xlarge       then "r8in.96xlarge"
      when AEC::InstanceType::R8ibLarge          then "r8ib.large"
      when AEC::InstanceType::R8ibXlarge         then "r8ib.xlarge"
      when AEC::InstanceType::R8ib2xlarge        then "r8ib.2xlarge"
      when AEC::InstanceType::R8ib4xlarge        then "r8ib.4xlarge"
      when AEC::InstanceType::R8ib8xlarge        then "r8ib.8xlarge"
      when AEC::InstanceType::R8ib12xlarge       then "r8ib.12xlarge"
      when AEC::InstanceType::R8ib16xlarge       then "r8ib.16xlarge"
      when AEC::InstanceType::R8ib24xlarge       then "r8ib.24xlarge"
      when AEC::InstanceType::R8ib32xlarge       then "r8ib.32xlarge"
      when AEC::InstanceType::R8ib48xlarge       then "r8ib.48xlarge"
      when AEC::InstanceType::R8ib96xlarge       then "r8ib.96xlarge"
      when AEC::InstanceType::M8inLarge          then "m8in.large"
      when AEC::InstanceType::M8inXlarge         then "m8in.xlarge"
      when AEC::InstanceType::M8in2xlarge        then "m8in.2xlarge"
      when AEC::InstanceType::M8in4xlarge        then "m8in.4xlarge"
      when AEC::InstanceType::M8in8xlarge        then "m8in.8xlarge"
      when AEC::InstanceType::M8in12xlarge       then "m8in.12xlarge"
      when AEC::InstanceType::M8in16xlarge       then "m8in.16xlarge"
      when AEC::InstanceType::M8in24xlarge       then "m8in.24xlarge"
      when AEC::InstanceType::M8in32xlarge       then "m8in.32xlarge"
      when AEC::InstanceType::M8in48xlarge       then "m8in.48xlarge"
      when AEC::InstanceType::M8in96xlarge       then "m8in.96xlarge"
      when AEC::InstanceType::M8ibLarge          then "m8ib.large"
      when AEC::InstanceType::M8ibXlarge         then "m8ib.xlarge"
      when AEC::InstanceType::M8ib2xlarge        then "m8ib.2xlarge"
      when AEC::InstanceType::M8ib4xlarge        then "m8ib.4xlarge"
      when AEC::InstanceType::M8ib8xlarge        then "m8ib.8xlarge"
      when AEC::InstanceType::M8ib12xlarge       then "m8ib.12xlarge"
      when AEC::InstanceType::M8ib16xlarge       then "m8ib.16xlarge"
      when AEC::InstanceType::M8ib24xlarge       then "m8ib.24xlarge"
      when AEC::InstanceType::M8ib32xlarge       then "m8ib.32xlarge"
      when AEC::InstanceType::M8ib48xlarge       then "m8ib.48xlarge"
      when AEC::InstanceType::M8ib96xlarge       then "m8ib.96xlarge"
      when AEC::InstanceType::M8ineLarge         then "m8ine.large"
      when AEC::InstanceType::M8ineXlarge        then "m8ine.xlarge"
      when AEC::InstanceType::M8ine2xlarge       then "m8ine.2xlarge"
      when AEC::InstanceType::M8ine4xlarge       then "m8ine.4xlarge"
      when AEC::InstanceType::M8ine8xlarge       then "m8ine.8xlarge"
      when AEC::InstanceType::M8ine12xlarge      then "m8ine.12xlarge"
      when AEC::InstanceType::C8ineLarge         then "c8ine.large"
      when AEC::InstanceType::C8ineXlarge        then "c8ine.xlarge"
      when AEC::InstanceType::C8ine2xlarge       then "c8ine.2xlarge"
      when AEC::InstanceType::C8ine4xlarge       then "c8ine.4xlarge"
      when AEC::InstanceType::C8ine8xlarge       then "c8ine.8xlarge"
      when AEC::InstanceType::C8ine12xlarge      then "c8ine.12xlarge"
      when AEC::InstanceType::M8idnLarge         then "m8idn.large"
      when AEC::InstanceType::M8idnXlarge        then "m8idn.xlarge"
      when AEC::InstanceType::M8idn2xlarge       then "m8idn.2xlarge"
      when AEC::InstanceType::M8idn4xlarge       then "m8idn.4xlarge"
      when AEC::InstanceType::M8idn8xlarge       then "m8idn.8xlarge"
      when AEC::InstanceType::M8idn12xlarge      then "m8idn.12xlarge"
      when AEC::InstanceType::M8idn16xlarge      then "m8idn.16xlarge"
      when AEC::InstanceType::M8idn24xlarge      then "m8idn.24xlarge"
      when AEC::InstanceType::M8idn32xlarge      then "m8idn.32xlarge"
      when AEC::InstanceType::M8idn48xlarge      then "m8idn.48xlarge"
      when AEC::InstanceType::M8idn96xlarge      then "m8idn.96xlarge"
      when AEC::InstanceType::R8idnLarge         then "r8idn.large"
      when AEC::InstanceType::R8idnXlarge        then "r8idn.xlarge"
      when AEC::InstanceType::R8idn2xlarge       then "r8idn.2xlarge"
      when AEC::InstanceType::R8idn4xlarge       then "r8idn.4xlarge"
      when AEC::InstanceType::R8idn8xlarge       then "r8idn.8xlarge"
      when AEC::InstanceType::R8idn12xlarge      then "r8idn.12xlarge"
      when AEC::InstanceType::R8idn16xlarge      then "r8idn.16xlarge"
      when AEC::InstanceType::R8idn24xlarge      then "r8idn.24xlarge"
      when AEC::InstanceType::R8idn32xlarge      then "r8idn.32xlarge"
      when AEC::InstanceType::R8idn48xlarge      then "r8idn.48xlarge"
      when AEC::InstanceType::R8idn96xlarge      then "r8idn.96xlarge"
      when AEC::InstanceType::M8idbLarge         then "m8idb.large"
      when AEC::InstanceType::M8idbXlarge        then "m8idb.xlarge"
      when AEC::InstanceType::M8idb2xlarge       then "m8idb.2xlarge"
      when AEC::InstanceType::M8idb4xlarge       then "m8idb.4xlarge"
      when AEC::InstanceType::M8idb8xlarge       then "m8idb.8xlarge"
      when AEC::InstanceType::M8idb12xlarge      then "m8idb.12xlarge"
      when AEC::InstanceType::M8idb16xlarge      then "m8idb.16xlarge"
      when AEC::InstanceType::M8idb24xlarge      then "m8idb.24xlarge"
      when AEC::InstanceType::M8idb32xlarge      then "m8idb.32xlarge"
      when AEC::InstanceType::M8idb48xlarge      then "m8idb.48xlarge"
      when AEC::InstanceType::M8idb96xlarge      then "m8idb.96xlarge"
      when AEC::InstanceType::R8idbLarge         then "r8idb.large"
      when AEC::InstanceType::R8idbXlarge        then "r8idb.xlarge"
      when AEC::InstanceType::R8idb2xlarge       then "r8idb.2xlarge"
      when AEC::InstanceType::R8idb4xlarge       then "r8idb.4xlarge"
      when AEC::InstanceType::R8idb8xlarge       then "r8idb.8xlarge"
      when AEC::InstanceType::R8idb12xlarge      then "r8idb.12xlarge"
      when AEC::InstanceType::R8idb16xlarge      then "r8idb.16xlarge"
      when AEC::InstanceType::R8idb24xlarge      then "r8idb.24xlarge"
      when AEC::InstanceType::R8idb32xlarge      then "r8idb.32xlarge"
      when AEC::InstanceType::R8idb48xlarge      then "r8idb.48xlarge"
      when AEC::InstanceType::R8idb96xlarge      then "r8idb.96xlarge"
      when AEC::InstanceType::MacM3ultraMetal    then "mac-m3ultra.metal"
      when AEC::InstanceType::M9gLarge           then "m9g.large"
      when AEC::InstanceType::M9gXlarge          then "m9g.xlarge"
      when AEC::InstanceType::M9g2xlarge         then "m9g.2xlarge"
      when AEC::InstanceType::M9g4xlarge         then "m9g.4xlarge"
      when AEC::InstanceType::M9g8xlarge         then "m9g.8xlarge"
      when AEC::InstanceType::M9g12xlarge        then "m9g.12xlarge"
      when AEC::InstanceType::M9g16xlarge        then "m9g.16xlarge"
      when AEC::InstanceType::M9g24xlarge        then "m9g.24xlarge"
      when AEC::InstanceType::M9g48xlarge        then "m9g.48xlarge"
      when AEC::InstanceType::M9gMetal24xl       then "m9g.metal-24xl"
      when AEC::InstanceType::M9gMetal48xl       then "m9g.metal-48xl"
      when AEC::InstanceType::M9gdLarge          then "m9gd.large"
      when AEC::InstanceType::M9gdXlarge         then "m9gd.xlarge"
      when AEC::InstanceType::M9gd2xlarge        then "m9gd.2xlarge"
      when AEC::InstanceType::M9gd4xlarge        then "m9gd.4xlarge"
      when AEC::InstanceType::M9gd8xlarge        then "m9gd.8xlarge"
      when AEC::InstanceType::M9gd12xlarge       then "m9gd.12xlarge"
      when AEC::InstanceType::M9gd16xlarge       then "m9gd.16xlarge"
      when AEC::InstanceType::M9gd24xlarge       then "m9gd.24xlarge"
      when AEC::InstanceType::M9gd48xlarge       then "m9gd.48xlarge"
      when AEC::InstanceType::M9gdMetal24xl      then "m9gd.metal-24xl"
      when AEC::InstanceType::M9gdMetal48xl      then "m9gd.metal-48xl"
      when AEC::InstanceType::R8inMetal48xl      then "r8in.metal-48xl"
      when AEC::InstanceType::R8inMetal96xl      then "r8in.metal-96xl"
      when AEC::InstanceType::R8ibMetal48xl      then "r8ib.metal-48xl"
      when AEC::InstanceType::R8ibMetal96xl      then "r8ib.metal-96xl"
      when AEC::InstanceType::R8idnMetal48xl     then "r8idn.metal-48xl"
      when AEC::InstanceType::R8idnMetal96xl     then "r8idn.metal-96xl"
      when AEC::InstanceType::R8idbMetal48xl     then "r8idb.metal-48xl"
      when AEC::InstanceType::R8idbMetal96xl     then "r8idb.metal-96xl"
      when AEC::InstanceType::M8inMetal48xl      then "m8in.metal-48xl"
      when AEC::InstanceType::M8inMetal96xl      then "m8in.metal-96xl"
      when AEC::InstanceType::M8ibMetal48xl      then "m8ib.metal-48xl"
      when AEC::InstanceType::M8ibMetal96xl      then "m8ib.metal-96xl"
      when AEC::InstanceType::M8idnMetal48xl     then "m8idn.metal-48xl"
      when AEC::InstanceType::M8idnMetal96xl     then "m8idn.metal-96xl"
      when AEC::InstanceType::M8idbMetal48xl     then "m8idb.metal-48xl"
      when AEC::InstanceType::M8idbMetal96xl     then "m8idb.metal-96xl"
      when AEC::InstanceType::G72xlarge          then "g7.2xlarge"
      when AEC::InstanceType::G74xlarge          then "g7.4xlarge"
      when AEC::InstanceType::G78xlarge          then "g7.8xlarge"
      when AEC::InstanceType::G712xlarge         then "g7.12xlarge"
      when AEC::InstanceType::G724xlarge         then "g7.24xlarge"
      when AEC::InstanceType::G748xlarge         then "g7.48xlarge"
      when AEC::InstanceType::C9gMedium          then "c9g.medium"
      when AEC::InstanceType::C9gLarge           then "c9g.large"
      when AEC::InstanceType::C9gXlarge          then "c9g.xlarge"
      when AEC::InstanceType::C9g2xlarge         then "c9g.2xlarge"
      when AEC::InstanceType::C9g4xlarge         then "c9g.4xlarge"
      when AEC::InstanceType::C9g8xlarge         then "c9g.8xlarge"
      when AEC::InstanceType::C9g12xlarge        then "c9g.12xlarge"
      when AEC::InstanceType::C9g16xlarge        then "c9g.16xlarge"
      when AEC::InstanceType::C9g24xlarge        then "c9g.24xlarge"
      when AEC::InstanceType::C9g48xlarge        then "c9g.48xlarge"
      when AEC::InstanceType::C9gMetal48xl       then "c9g.metal-48xl"
      when AEC::InstanceType::C9gdMedium         then "c9gd.medium"
      when AEC::InstanceType::C9gdLarge          then "c9gd.large"
      when AEC::InstanceType::C9gdXlarge         then "c9gd.xlarge"
      when AEC::InstanceType::C9gd2xlarge        then "c9gd.2xlarge"
      when AEC::InstanceType::C9gd4xlarge        then "c9gd.4xlarge"
      when AEC::InstanceType::C9gd8xlarge        then "c9gd.8xlarge"
      when AEC::InstanceType::C9gd12xlarge       then "c9gd.12xlarge"
      when AEC::InstanceType::C9gd16xlarge       then "c9gd.16xlarge"
      when AEC::InstanceType::C9gd24xlarge       then "c9gd.24xlarge"
      when AEC::InstanceType::C9gd48xlarge       then "c9gd.48xlarge"
      when AEC::InstanceType::C9gdMetal48xl      then "c9gd.metal-48xl"
      else
        raise Exception.new("unknown enum value for 'InstanceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceType?
      case key
      when "a1.medium"            then AEC::InstanceType::A1Medium
      when "a1.large"             then AEC::InstanceType::A1Large
      when "a1.xlarge"            then AEC::InstanceType::A1Xlarge
      when "a1.2xlarge"           then AEC::InstanceType::A12xlarge
      when "a1.4xlarge"           then AEC::InstanceType::A14xlarge
      when "a1.metal"             then AEC::InstanceType::A1Metal
      when "c1.medium"            then AEC::InstanceType::C1Medium
      when "c1.xlarge"            then AEC::InstanceType::C1Xlarge
      when "c3.large"             then AEC::InstanceType::C3Large
      when "c3.xlarge"            then AEC::InstanceType::C3Xlarge
      when "c3.2xlarge"           then AEC::InstanceType::C32xlarge
      when "c3.4xlarge"           then AEC::InstanceType::C34xlarge
      when "c3.8xlarge"           then AEC::InstanceType::C38xlarge
      when "c4.large"             then AEC::InstanceType::C4Large
      when "c4.xlarge"            then AEC::InstanceType::C4Xlarge
      when "c4.2xlarge"           then AEC::InstanceType::C42xlarge
      when "c4.4xlarge"           then AEC::InstanceType::C44xlarge
      when "c4.8xlarge"           then AEC::InstanceType::C48xlarge
      when "c5.large"             then AEC::InstanceType::C5Large
      when "c5.xlarge"            then AEC::InstanceType::C5Xlarge
      when "c5.2xlarge"           then AEC::InstanceType::C52xlarge
      when "c5.4xlarge"           then AEC::InstanceType::C54xlarge
      when "c5.9xlarge"           then AEC::InstanceType::C59xlarge
      when "c5.12xlarge"          then AEC::InstanceType::C512xlarge
      when "c5.18xlarge"          then AEC::InstanceType::C518xlarge
      when "c5.24xlarge"          then AEC::InstanceType::C524xlarge
      when "c5.metal"             then AEC::InstanceType::C5Metal
      when "c5a.large"            then AEC::InstanceType::C5aLarge
      when "c5a.xlarge"           then AEC::InstanceType::C5aXlarge
      when "c5a.2xlarge"          then AEC::InstanceType::C5a2xlarge
      when "c5a.4xlarge"          then AEC::InstanceType::C5a4xlarge
      when "c5a.8xlarge"          then AEC::InstanceType::C5a8xlarge
      when "c5a.12xlarge"         then AEC::InstanceType::C5a12xlarge
      when "c5a.16xlarge"         then AEC::InstanceType::C5a16xlarge
      when "c5a.24xlarge"         then AEC::InstanceType::C5a24xlarge
      when "c5ad.large"           then AEC::InstanceType::C5adLarge
      when "c5ad.xlarge"          then AEC::InstanceType::C5adXlarge
      when "c5ad.2xlarge"         then AEC::InstanceType::C5ad2xlarge
      when "c5ad.4xlarge"         then AEC::InstanceType::C5ad4xlarge
      when "c5ad.8xlarge"         then AEC::InstanceType::C5ad8xlarge
      when "c5ad.12xlarge"        then AEC::InstanceType::C5ad12xlarge
      when "c5ad.16xlarge"        then AEC::InstanceType::C5ad16xlarge
      when "c5ad.24xlarge"        then AEC::InstanceType::C5ad24xlarge
      when "c5d.large"            then AEC::InstanceType::C5dLarge
      when "c5d.xlarge"           then AEC::InstanceType::C5dXlarge
      when "c5d.2xlarge"          then AEC::InstanceType::C5d2xlarge
      when "c5d.4xlarge"          then AEC::InstanceType::C5d4xlarge
      when "c5d.9xlarge"          then AEC::InstanceType::C5d9xlarge
      when "c5d.12xlarge"         then AEC::InstanceType::C5d12xlarge
      when "c5d.18xlarge"         then AEC::InstanceType::C5d18xlarge
      when "c5d.24xlarge"         then AEC::InstanceType::C5d24xlarge
      when "c5d.metal"            then AEC::InstanceType::C5dMetal
      when "c5n.large"            then AEC::InstanceType::C5nLarge
      when "c5n.xlarge"           then AEC::InstanceType::C5nXlarge
      when "c5n.2xlarge"          then AEC::InstanceType::C5n2xlarge
      when "c5n.4xlarge"          then AEC::InstanceType::C5n4xlarge
      when "c5n.9xlarge"          then AEC::InstanceType::C5n9xlarge
      when "c5n.18xlarge"         then AEC::InstanceType::C5n18xlarge
      when "c5n.metal"            then AEC::InstanceType::C5nMetal
      when "c6g.medium"           then AEC::InstanceType::C6gMedium
      when "c6g.large"            then AEC::InstanceType::C6gLarge
      when "c6g.xlarge"           then AEC::InstanceType::C6gXlarge
      when "c6g.2xlarge"          then AEC::InstanceType::C6g2xlarge
      when "c6g.4xlarge"          then AEC::InstanceType::C6g4xlarge
      when "c6g.8xlarge"          then AEC::InstanceType::C6g8xlarge
      when "c6g.12xlarge"         then AEC::InstanceType::C6g12xlarge
      when "c6g.16xlarge"         then AEC::InstanceType::C6g16xlarge
      when "c6g.metal"            then AEC::InstanceType::C6gMetal
      when "c6gd.medium"          then AEC::InstanceType::C6gdMedium
      when "c6gd.large"           then AEC::InstanceType::C6gdLarge
      when "c6gd.xlarge"          then AEC::InstanceType::C6gdXlarge
      when "c6gd.2xlarge"         then AEC::InstanceType::C6gd2xlarge
      when "c6gd.4xlarge"         then AEC::InstanceType::C6gd4xlarge
      when "c6gd.8xlarge"         then AEC::InstanceType::C6gd8xlarge
      when "c6gd.12xlarge"        then AEC::InstanceType::C6gd12xlarge
      when "c6gd.16xlarge"        then AEC::InstanceType::C6gd16xlarge
      when "c6gd.metal"           then AEC::InstanceType::C6gdMetal
      when "c6gn.medium"          then AEC::InstanceType::C6gnMedium
      when "c6gn.large"           then AEC::InstanceType::C6gnLarge
      when "c6gn.xlarge"          then AEC::InstanceType::C6gnXlarge
      when "c6gn.2xlarge"         then AEC::InstanceType::C6gn2xlarge
      when "c6gn.4xlarge"         then AEC::InstanceType::C6gn4xlarge
      when "c6gn.8xlarge"         then AEC::InstanceType::C6gn8xlarge
      when "c6gn.12xlarge"        then AEC::InstanceType::C6gn12xlarge
      when "c6gn.16xlarge"        then AEC::InstanceType::C6gn16xlarge
      when "c6i.large"            then AEC::InstanceType::C6iLarge
      when "c6i.xlarge"           then AEC::InstanceType::C6iXlarge
      when "c6i.2xlarge"          then AEC::InstanceType::C6i2xlarge
      when "c6i.4xlarge"          then AEC::InstanceType::C6i4xlarge
      when "c6i.8xlarge"          then AEC::InstanceType::C6i8xlarge
      when "c6i.12xlarge"         then AEC::InstanceType::C6i12xlarge
      when "c6i.16xlarge"         then AEC::InstanceType::C6i16xlarge
      when "c6i.24xlarge"         then AEC::InstanceType::C6i24xlarge
      when "c6i.32xlarge"         then AEC::InstanceType::C6i32xlarge
      when "c6i.metal"            then AEC::InstanceType::C6iMetal
      when "cc1.4xlarge"          then AEC::InstanceType::Cc14xlarge
      when "cc2.8xlarge"          then AEC::InstanceType::Cc28xlarge
      when "cg1.4xlarge"          then AEC::InstanceType::Cg14xlarge
      when "cr1.8xlarge"          then AEC::InstanceType::Cr18xlarge
      when "d2.xlarge"            then AEC::InstanceType::D2Xlarge
      when "d2.2xlarge"           then AEC::InstanceType::D22xlarge
      when "d2.4xlarge"           then AEC::InstanceType::D24xlarge
      when "d2.8xlarge"           then AEC::InstanceType::D28xlarge
      when "d3.xlarge"            then AEC::InstanceType::D3Xlarge
      when "d3.2xlarge"           then AEC::InstanceType::D32xlarge
      when "d3.4xlarge"           then AEC::InstanceType::D34xlarge
      when "d3.8xlarge"           then AEC::InstanceType::D38xlarge
      when "d3en.xlarge"          then AEC::InstanceType::D3enXlarge
      when "d3en.2xlarge"         then AEC::InstanceType::D3en2xlarge
      when "d3en.4xlarge"         then AEC::InstanceType::D3en4xlarge
      when "d3en.6xlarge"         then AEC::InstanceType::D3en6xlarge
      when "d3en.8xlarge"         then AEC::InstanceType::D3en8xlarge
      when "d3en.12xlarge"        then AEC::InstanceType::D3en12xlarge
      when "dl1.24xlarge"         then AEC::InstanceType::Dl124xlarge
      when "f1.2xlarge"           then AEC::InstanceType::F12xlarge
      when "f1.4xlarge"           then AEC::InstanceType::F14xlarge
      when "f1.16xlarge"          then AEC::InstanceType::F116xlarge
      when "g2.2xlarge"           then AEC::InstanceType::G22xlarge
      when "g2.8xlarge"           then AEC::InstanceType::G28xlarge
      when "g3.4xlarge"           then AEC::InstanceType::G34xlarge
      when "g3.8xlarge"           then AEC::InstanceType::G38xlarge
      when "g3.16xlarge"          then AEC::InstanceType::G316xlarge
      when "g3s.xlarge"           then AEC::InstanceType::G3sXlarge
      when "g4ad.xlarge"          then AEC::InstanceType::G4adXlarge
      when "g4ad.2xlarge"         then AEC::InstanceType::G4ad2xlarge
      when "g4ad.4xlarge"         then AEC::InstanceType::G4ad4xlarge
      when "g4ad.8xlarge"         then AEC::InstanceType::G4ad8xlarge
      when "g4ad.16xlarge"        then AEC::InstanceType::G4ad16xlarge
      when "g4dn.xlarge"          then AEC::InstanceType::G4dnXlarge
      when "g4dn.2xlarge"         then AEC::InstanceType::G4dn2xlarge
      when "g4dn.4xlarge"         then AEC::InstanceType::G4dn4xlarge
      when "g4dn.8xlarge"         then AEC::InstanceType::G4dn8xlarge
      when "g4dn.12xlarge"        then AEC::InstanceType::G4dn12xlarge
      when "g4dn.16xlarge"        then AEC::InstanceType::G4dn16xlarge
      when "g4dn.metal"           then AEC::InstanceType::G4dnMetal
      when "g5.xlarge"            then AEC::InstanceType::G5Xlarge
      when "g5.2xlarge"           then AEC::InstanceType::G52xlarge
      when "g5.4xlarge"           then AEC::InstanceType::G54xlarge
      when "g5.8xlarge"           then AEC::InstanceType::G58xlarge
      when "g5.12xlarge"          then AEC::InstanceType::G512xlarge
      when "g5.16xlarge"          then AEC::InstanceType::G516xlarge
      when "g5.24xlarge"          then AEC::InstanceType::G524xlarge
      when "g5.48xlarge"          then AEC::InstanceType::G548xlarge
      when "g5g.xlarge"           then AEC::InstanceType::G5gXlarge
      when "g5g.2xlarge"          then AEC::InstanceType::G5g2xlarge
      when "g5g.4xlarge"          then AEC::InstanceType::G5g4xlarge
      when "g5g.8xlarge"          then AEC::InstanceType::G5g8xlarge
      when "g5g.16xlarge"         then AEC::InstanceType::G5g16xlarge
      when "g5g.metal"            then AEC::InstanceType::G5gMetal
      when "hi1.4xlarge"          then AEC::InstanceType::Hi14xlarge
      when "hpc6a.48xlarge"       then AEC::InstanceType::Hpc6a48xlarge
      when "hs1.8xlarge"          then AEC::InstanceType::Hs18xlarge
      when "h1.2xlarge"           then AEC::InstanceType::H12xlarge
      when "h1.4xlarge"           then AEC::InstanceType::H14xlarge
      when "h1.8xlarge"           then AEC::InstanceType::H18xlarge
      when "h1.16xlarge"          then AEC::InstanceType::H116xlarge
      when "i2.xlarge"            then AEC::InstanceType::I2Xlarge
      when "i2.2xlarge"           then AEC::InstanceType::I22xlarge
      when "i2.4xlarge"           then AEC::InstanceType::I24xlarge
      when "i2.8xlarge"           then AEC::InstanceType::I28xlarge
      when "i3.large"             then AEC::InstanceType::I3Large
      when "i3.xlarge"            then AEC::InstanceType::I3Xlarge
      when "i3.2xlarge"           then AEC::InstanceType::I32xlarge
      when "i3.4xlarge"           then AEC::InstanceType::I34xlarge
      when "i3.8xlarge"           then AEC::InstanceType::I38xlarge
      when "i3.16xlarge"          then AEC::InstanceType::I316xlarge
      when "i3.metal"             then AEC::InstanceType::I3Metal
      when "i3en.large"           then AEC::InstanceType::I3enLarge
      when "i3en.xlarge"          then AEC::InstanceType::I3enXlarge
      when "i3en.2xlarge"         then AEC::InstanceType::I3en2xlarge
      when "i3en.3xlarge"         then AEC::InstanceType::I3en3xlarge
      when "i3en.6xlarge"         then AEC::InstanceType::I3en6xlarge
      when "i3en.12xlarge"        then AEC::InstanceType::I3en12xlarge
      when "i3en.24xlarge"        then AEC::InstanceType::I3en24xlarge
      when "i3en.metal"           then AEC::InstanceType::I3enMetal
      when "im4gn.large"          then AEC::InstanceType::Im4gnLarge
      when "im4gn.xlarge"         then AEC::InstanceType::Im4gnXlarge
      when "im4gn.2xlarge"        then AEC::InstanceType::Im4gn2xlarge
      when "im4gn.4xlarge"        then AEC::InstanceType::Im4gn4xlarge
      when "im4gn.8xlarge"        then AEC::InstanceType::Im4gn8xlarge
      when "im4gn.16xlarge"       then AEC::InstanceType::Im4gn16xlarge
      when "inf1.xlarge"          then AEC::InstanceType::Inf1Xlarge
      when "inf1.2xlarge"         then AEC::InstanceType::Inf12xlarge
      when "inf1.6xlarge"         then AEC::InstanceType::Inf16xlarge
      when "inf1.24xlarge"        then AEC::InstanceType::Inf124xlarge
      when "is4gen.medium"        then AEC::InstanceType::Is4genMedium
      when "is4gen.large"         then AEC::InstanceType::Is4genLarge
      when "is4gen.xlarge"        then AEC::InstanceType::Is4genXlarge
      when "is4gen.2xlarge"       then AEC::InstanceType::Is4gen2xlarge
      when "is4gen.4xlarge"       then AEC::InstanceType::Is4gen4xlarge
      when "is4gen.8xlarge"       then AEC::InstanceType::Is4gen8xlarge
      when "m1.small"             then AEC::InstanceType::M1Small
      when "m1.medium"            then AEC::InstanceType::M1Medium
      when "m1.large"             then AEC::InstanceType::M1Large
      when "m1.xlarge"            then AEC::InstanceType::M1Xlarge
      when "m2.xlarge"            then AEC::InstanceType::M2Xlarge
      when "m2.2xlarge"           then AEC::InstanceType::M22xlarge
      when "m2.4xlarge"           then AEC::InstanceType::M24xlarge
      when "m3.medium"            then AEC::InstanceType::M3Medium
      when "m3.large"             then AEC::InstanceType::M3Large
      when "m3.xlarge"            then AEC::InstanceType::M3Xlarge
      when "m3.2xlarge"           then AEC::InstanceType::M32xlarge
      when "m4.large"             then AEC::InstanceType::M4Large
      when "m4.xlarge"            then AEC::InstanceType::M4Xlarge
      when "m4.2xlarge"           then AEC::InstanceType::M42xlarge
      when "m4.4xlarge"           then AEC::InstanceType::M44xlarge
      when "m4.10xlarge"          then AEC::InstanceType::M410xlarge
      when "m4.16xlarge"          then AEC::InstanceType::M416xlarge
      when "m5.large"             then AEC::InstanceType::M5Large
      when "m5.xlarge"            then AEC::InstanceType::M5Xlarge
      when "m5.2xlarge"           then AEC::InstanceType::M52xlarge
      when "m5.4xlarge"           then AEC::InstanceType::M54xlarge
      when "m5.8xlarge"           then AEC::InstanceType::M58xlarge
      when "m5.12xlarge"          then AEC::InstanceType::M512xlarge
      when "m5.16xlarge"          then AEC::InstanceType::M516xlarge
      when "m5.24xlarge"          then AEC::InstanceType::M524xlarge
      when "m5.metal"             then AEC::InstanceType::M5Metal
      when "m5a.large"            then AEC::InstanceType::M5aLarge
      when "m5a.xlarge"           then AEC::InstanceType::M5aXlarge
      when "m5a.2xlarge"          then AEC::InstanceType::M5a2xlarge
      when "m5a.4xlarge"          then AEC::InstanceType::M5a4xlarge
      when "m5a.8xlarge"          then AEC::InstanceType::M5a8xlarge
      when "m5a.12xlarge"         then AEC::InstanceType::M5a12xlarge
      when "m5a.16xlarge"         then AEC::InstanceType::M5a16xlarge
      when "m5a.24xlarge"         then AEC::InstanceType::M5a24xlarge
      when "m5ad.large"           then AEC::InstanceType::M5adLarge
      when "m5ad.xlarge"          then AEC::InstanceType::M5adXlarge
      when "m5ad.2xlarge"         then AEC::InstanceType::M5ad2xlarge
      when "m5ad.4xlarge"         then AEC::InstanceType::M5ad4xlarge
      when "m5ad.8xlarge"         then AEC::InstanceType::M5ad8xlarge
      when "m5ad.12xlarge"        then AEC::InstanceType::M5ad12xlarge
      when "m5ad.16xlarge"        then AEC::InstanceType::M5ad16xlarge
      when "m5ad.24xlarge"        then AEC::InstanceType::M5ad24xlarge
      when "m5d.large"            then AEC::InstanceType::M5dLarge
      when "m5d.xlarge"           then AEC::InstanceType::M5dXlarge
      when "m5d.2xlarge"          then AEC::InstanceType::M5d2xlarge
      when "m5d.4xlarge"          then AEC::InstanceType::M5d4xlarge
      when "m5d.8xlarge"          then AEC::InstanceType::M5d8xlarge
      when "m5d.12xlarge"         then AEC::InstanceType::M5d12xlarge
      when "m5d.16xlarge"         then AEC::InstanceType::M5d16xlarge
      when "m5d.24xlarge"         then AEC::InstanceType::M5d24xlarge
      when "m5d.metal"            then AEC::InstanceType::M5dMetal
      when "m5dn.large"           then AEC::InstanceType::M5dnLarge
      when "m5dn.xlarge"          then AEC::InstanceType::M5dnXlarge
      when "m5dn.2xlarge"         then AEC::InstanceType::M5dn2xlarge
      when "m5dn.4xlarge"         then AEC::InstanceType::M5dn4xlarge
      when "m5dn.8xlarge"         then AEC::InstanceType::M5dn8xlarge
      when "m5dn.12xlarge"        then AEC::InstanceType::M5dn12xlarge
      when "m5dn.16xlarge"        then AEC::InstanceType::M5dn16xlarge
      when "m5dn.24xlarge"        then AEC::InstanceType::M5dn24xlarge
      when "m5dn.metal"           then AEC::InstanceType::M5dnMetal
      when "m5n.large"            then AEC::InstanceType::M5nLarge
      when "m5n.xlarge"           then AEC::InstanceType::M5nXlarge
      when "m5n.2xlarge"          then AEC::InstanceType::M5n2xlarge
      when "m5n.4xlarge"          then AEC::InstanceType::M5n4xlarge
      when "m5n.8xlarge"          then AEC::InstanceType::M5n8xlarge
      when "m5n.12xlarge"         then AEC::InstanceType::M5n12xlarge
      when "m5n.16xlarge"         then AEC::InstanceType::M5n16xlarge
      when "m5n.24xlarge"         then AEC::InstanceType::M5n24xlarge
      when "m5n.metal"            then AEC::InstanceType::M5nMetal
      when "m5zn.large"           then AEC::InstanceType::M5znLarge
      when "m5zn.xlarge"          then AEC::InstanceType::M5znXlarge
      when "m5zn.2xlarge"         then AEC::InstanceType::M5zn2xlarge
      when "m5zn.3xlarge"         then AEC::InstanceType::M5zn3xlarge
      when "m5zn.6xlarge"         then AEC::InstanceType::M5zn6xlarge
      when "m5zn.12xlarge"        then AEC::InstanceType::M5zn12xlarge
      when "m5zn.metal"           then AEC::InstanceType::M5znMetal
      when "m6a.large"            then AEC::InstanceType::M6aLarge
      when "m6a.xlarge"           then AEC::InstanceType::M6aXlarge
      when "m6a.2xlarge"          then AEC::InstanceType::M6a2xlarge
      when "m6a.4xlarge"          then AEC::InstanceType::M6a4xlarge
      when "m6a.8xlarge"          then AEC::InstanceType::M6a8xlarge
      when "m6a.12xlarge"         then AEC::InstanceType::M6a12xlarge
      when "m6a.16xlarge"         then AEC::InstanceType::M6a16xlarge
      when "m6a.24xlarge"         then AEC::InstanceType::M6a24xlarge
      when "m6a.32xlarge"         then AEC::InstanceType::M6a32xlarge
      when "m6a.48xlarge"         then AEC::InstanceType::M6a48xlarge
      when "m6g.metal"            then AEC::InstanceType::M6gMetal
      when "m6g.medium"           then AEC::InstanceType::M6gMedium
      when "m6g.large"            then AEC::InstanceType::M6gLarge
      when "m6g.xlarge"           then AEC::InstanceType::M6gXlarge
      when "m6g.2xlarge"          then AEC::InstanceType::M6g2xlarge
      when "m6g.4xlarge"          then AEC::InstanceType::M6g4xlarge
      when "m6g.8xlarge"          then AEC::InstanceType::M6g8xlarge
      when "m6g.12xlarge"         then AEC::InstanceType::M6g12xlarge
      when "m6g.16xlarge"         then AEC::InstanceType::M6g16xlarge
      when "m6gd.metal"           then AEC::InstanceType::M6gdMetal
      when "m6gd.medium"          then AEC::InstanceType::M6gdMedium
      when "m6gd.large"           then AEC::InstanceType::M6gdLarge
      when "m6gd.xlarge"          then AEC::InstanceType::M6gdXlarge
      when "m6gd.2xlarge"         then AEC::InstanceType::M6gd2xlarge
      when "m6gd.4xlarge"         then AEC::InstanceType::M6gd4xlarge
      when "m6gd.8xlarge"         then AEC::InstanceType::M6gd8xlarge
      when "m6gd.12xlarge"        then AEC::InstanceType::M6gd12xlarge
      when "m6gd.16xlarge"        then AEC::InstanceType::M6gd16xlarge
      when "m6i.large"            then AEC::InstanceType::M6iLarge
      when "m6i.xlarge"           then AEC::InstanceType::M6iXlarge
      when "m6i.2xlarge"          then AEC::InstanceType::M6i2xlarge
      when "m6i.4xlarge"          then AEC::InstanceType::M6i4xlarge
      when "m6i.8xlarge"          then AEC::InstanceType::M6i8xlarge
      when "m6i.12xlarge"         then AEC::InstanceType::M6i12xlarge
      when "m6i.16xlarge"         then AEC::InstanceType::M6i16xlarge
      when "m6i.24xlarge"         then AEC::InstanceType::M6i24xlarge
      when "m6i.32xlarge"         then AEC::InstanceType::M6i32xlarge
      when "m6i.metal"            then AEC::InstanceType::M6iMetal
      when "mac1.metal"           then AEC::InstanceType::Mac1Metal
      when "p2.xlarge"            then AEC::InstanceType::P2Xlarge
      when "p2.8xlarge"           then AEC::InstanceType::P28xlarge
      when "p2.16xlarge"          then AEC::InstanceType::P216xlarge
      when "p3.2xlarge"           then AEC::InstanceType::P32xlarge
      when "p3.8xlarge"           then AEC::InstanceType::P38xlarge
      when "p3.16xlarge"          then AEC::InstanceType::P316xlarge
      when "p3dn.24xlarge"        then AEC::InstanceType::P3dn24xlarge
      when "p4d.24xlarge"         then AEC::InstanceType::P4d24xlarge
      when "r3.large"             then AEC::InstanceType::R3Large
      when "r3.xlarge"            then AEC::InstanceType::R3Xlarge
      when "r3.2xlarge"           then AEC::InstanceType::R32xlarge
      when "r3.4xlarge"           then AEC::InstanceType::R34xlarge
      when "r3.8xlarge"           then AEC::InstanceType::R38xlarge
      when "r4.large"             then AEC::InstanceType::R4Large
      when "r4.xlarge"            then AEC::InstanceType::R4Xlarge
      when "r4.2xlarge"           then AEC::InstanceType::R42xlarge
      when "r4.4xlarge"           then AEC::InstanceType::R44xlarge
      when "r4.8xlarge"           then AEC::InstanceType::R48xlarge
      when "r4.16xlarge"          then AEC::InstanceType::R416xlarge
      when "r5.large"             then AEC::InstanceType::R5Large
      when "r5.xlarge"            then AEC::InstanceType::R5Xlarge
      when "r5.2xlarge"           then AEC::InstanceType::R52xlarge
      when "r5.4xlarge"           then AEC::InstanceType::R54xlarge
      when "r5.8xlarge"           then AEC::InstanceType::R58xlarge
      when "r5.12xlarge"          then AEC::InstanceType::R512xlarge
      when "r5.16xlarge"          then AEC::InstanceType::R516xlarge
      when "r5.24xlarge"          then AEC::InstanceType::R524xlarge
      when "r5.metal"             then AEC::InstanceType::R5Metal
      when "r5a.large"            then AEC::InstanceType::R5aLarge
      when "r5a.xlarge"           then AEC::InstanceType::R5aXlarge
      when "r5a.2xlarge"          then AEC::InstanceType::R5a2xlarge
      when "r5a.4xlarge"          then AEC::InstanceType::R5a4xlarge
      when "r5a.8xlarge"          then AEC::InstanceType::R5a8xlarge
      when "r5a.12xlarge"         then AEC::InstanceType::R5a12xlarge
      when "r5a.16xlarge"         then AEC::InstanceType::R5a16xlarge
      when "r5a.24xlarge"         then AEC::InstanceType::R5a24xlarge
      when "r5ad.large"           then AEC::InstanceType::R5adLarge
      when "r5ad.xlarge"          then AEC::InstanceType::R5adXlarge
      when "r5ad.2xlarge"         then AEC::InstanceType::R5ad2xlarge
      when "r5ad.4xlarge"         then AEC::InstanceType::R5ad4xlarge
      when "r5ad.8xlarge"         then AEC::InstanceType::R5ad8xlarge
      when "r5ad.12xlarge"        then AEC::InstanceType::R5ad12xlarge
      when "r5ad.16xlarge"        then AEC::InstanceType::R5ad16xlarge
      when "r5ad.24xlarge"        then AEC::InstanceType::R5ad24xlarge
      when "r5b.large"            then AEC::InstanceType::R5bLarge
      when "r5b.xlarge"           then AEC::InstanceType::R5bXlarge
      when "r5b.2xlarge"          then AEC::InstanceType::R5b2xlarge
      when "r5b.4xlarge"          then AEC::InstanceType::R5b4xlarge
      when "r5b.8xlarge"          then AEC::InstanceType::R5b8xlarge
      when "r5b.12xlarge"         then AEC::InstanceType::R5b12xlarge
      when "r5b.16xlarge"         then AEC::InstanceType::R5b16xlarge
      when "r5b.24xlarge"         then AEC::InstanceType::R5b24xlarge
      when "r5b.metal"            then AEC::InstanceType::R5bMetal
      when "r5d.large"            then AEC::InstanceType::R5dLarge
      when "r5d.xlarge"           then AEC::InstanceType::R5dXlarge
      when "r5d.2xlarge"          then AEC::InstanceType::R5d2xlarge
      when "r5d.4xlarge"          then AEC::InstanceType::R5d4xlarge
      when "r5d.8xlarge"          then AEC::InstanceType::R5d8xlarge
      when "r5d.12xlarge"         then AEC::InstanceType::R5d12xlarge
      when "r5d.16xlarge"         then AEC::InstanceType::R5d16xlarge
      when "r5d.24xlarge"         then AEC::InstanceType::R5d24xlarge
      when "r5d.metal"            then AEC::InstanceType::R5dMetal
      when "r5dn.large"           then AEC::InstanceType::R5dnLarge
      when "r5dn.xlarge"          then AEC::InstanceType::R5dnXlarge
      when "r5dn.2xlarge"         then AEC::InstanceType::R5dn2xlarge
      when "r5dn.4xlarge"         then AEC::InstanceType::R5dn4xlarge
      when "r5dn.8xlarge"         then AEC::InstanceType::R5dn8xlarge
      when "r5dn.12xlarge"        then AEC::InstanceType::R5dn12xlarge
      when "r5dn.16xlarge"        then AEC::InstanceType::R5dn16xlarge
      when "r5dn.24xlarge"        then AEC::InstanceType::R5dn24xlarge
      when "r5dn.metal"           then AEC::InstanceType::R5dnMetal
      when "r5n.large"            then AEC::InstanceType::R5nLarge
      when "r5n.xlarge"           then AEC::InstanceType::R5nXlarge
      when "r5n.2xlarge"          then AEC::InstanceType::R5n2xlarge
      when "r5n.4xlarge"          then AEC::InstanceType::R5n4xlarge
      when "r5n.8xlarge"          then AEC::InstanceType::R5n8xlarge
      when "r5n.12xlarge"         then AEC::InstanceType::R5n12xlarge
      when "r5n.16xlarge"         then AEC::InstanceType::R5n16xlarge
      when "r5n.24xlarge"         then AEC::InstanceType::R5n24xlarge
      when "r5n.metal"            then AEC::InstanceType::R5nMetal
      when "r6g.medium"           then AEC::InstanceType::R6gMedium
      when "r6g.large"            then AEC::InstanceType::R6gLarge
      when "r6g.xlarge"           then AEC::InstanceType::R6gXlarge
      when "r6g.2xlarge"          then AEC::InstanceType::R6g2xlarge
      when "r6g.4xlarge"          then AEC::InstanceType::R6g4xlarge
      when "r6g.8xlarge"          then AEC::InstanceType::R6g8xlarge
      when "r6g.12xlarge"         then AEC::InstanceType::R6g12xlarge
      when "r6g.16xlarge"         then AEC::InstanceType::R6g16xlarge
      when "r6g.metal"            then AEC::InstanceType::R6gMetal
      when "r6gd.medium"          then AEC::InstanceType::R6gdMedium
      when "r6gd.large"           then AEC::InstanceType::R6gdLarge
      when "r6gd.xlarge"          then AEC::InstanceType::R6gdXlarge
      when "r6gd.2xlarge"         then AEC::InstanceType::R6gd2xlarge
      when "r6gd.4xlarge"         then AEC::InstanceType::R6gd4xlarge
      when "r6gd.8xlarge"         then AEC::InstanceType::R6gd8xlarge
      when "r6gd.12xlarge"        then AEC::InstanceType::R6gd12xlarge
      when "r6gd.16xlarge"        then AEC::InstanceType::R6gd16xlarge
      when "r6gd.metal"           then AEC::InstanceType::R6gdMetal
      when "r6i.large"            then AEC::InstanceType::R6iLarge
      when "r6i.xlarge"           then AEC::InstanceType::R6iXlarge
      when "r6i.2xlarge"          then AEC::InstanceType::R6i2xlarge
      when "r6i.4xlarge"          then AEC::InstanceType::R6i4xlarge
      when "r6i.8xlarge"          then AEC::InstanceType::R6i8xlarge
      when "r6i.12xlarge"         then AEC::InstanceType::R6i12xlarge
      when "r6i.16xlarge"         then AEC::InstanceType::R6i16xlarge
      when "r6i.24xlarge"         then AEC::InstanceType::R6i24xlarge
      when "r6i.32xlarge"         then AEC::InstanceType::R6i32xlarge
      when "r6i.metal"            then AEC::InstanceType::R6iMetal
      when "t1.micro"             then AEC::InstanceType::T1Micro
      when "t2.nano"              then AEC::InstanceType::T2Nano
      when "t2.micro"             then AEC::InstanceType::T2Micro
      when "t2.small"             then AEC::InstanceType::T2Small
      when "t2.medium"            then AEC::InstanceType::T2Medium
      when "t2.large"             then AEC::InstanceType::T2Large
      when "t2.xlarge"            then AEC::InstanceType::T2Xlarge
      when "t2.2xlarge"           then AEC::InstanceType::T22xlarge
      when "t3.nano"              then AEC::InstanceType::T3Nano
      when "t3.micro"             then AEC::InstanceType::T3Micro
      when "t3.small"             then AEC::InstanceType::T3Small
      when "t3.medium"            then AEC::InstanceType::T3Medium
      when "t3.large"             then AEC::InstanceType::T3Large
      when "t3.xlarge"            then AEC::InstanceType::T3Xlarge
      when "t3.2xlarge"           then AEC::InstanceType::T32xlarge
      when "t3a.nano"             then AEC::InstanceType::T3aNano
      when "t3a.micro"            then AEC::InstanceType::T3aMicro
      when "t3a.small"            then AEC::InstanceType::T3aSmall
      when "t3a.medium"           then AEC::InstanceType::T3aMedium
      when "t3a.large"            then AEC::InstanceType::T3aLarge
      when "t3a.xlarge"           then AEC::InstanceType::T3aXlarge
      when "t3a.2xlarge"          then AEC::InstanceType::T3a2xlarge
      when "t4g.nano"             then AEC::InstanceType::T4gNano
      when "t4g.micro"            then AEC::InstanceType::T4gMicro
      when "t4g.small"            then AEC::InstanceType::T4gSmall
      when "t4g.medium"           then AEC::InstanceType::T4gMedium
      when "t4g.large"            then AEC::InstanceType::T4gLarge
      when "t4g.xlarge"           then AEC::InstanceType::T4gXlarge
      when "t4g.2xlarge"          then AEC::InstanceType::T4g2xlarge
      when "u-6tb1.56xlarge"      then AEC::InstanceType::U6tb156xlarge
      when "u-6tb1.112xlarge"     then AEC::InstanceType::U6tb1112xlarge
      when "u-9tb1.112xlarge"     then AEC::InstanceType::U9tb1112xlarge
      when "u-12tb1.112xlarge"    then AEC::InstanceType::U12tb1112xlarge
      when "u-6tb1.metal"         then AEC::InstanceType::U6tb1Metal
      when "u-9tb1.metal"         then AEC::InstanceType::U9tb1Metal
      when "u-12tb1.metal"        then AEC::InstanceType::U12tb1Metal
      when "u-18tb1.metal"        then AEC::InstanceType::U18tb1Metal
      when "u-24tb1.metal"        then AEC::InstanceType::U24tb1Metal
      when "vt1.3xlarge"          then AEC::InstanceType::Vt13xlarge
      when "vt1.6xlarge"          then AEC::InstanceType::Vt16xlarge
      when "vt1.24xlarge"         then AEC::InstanceType::Vt124xlarge
      when "x1.16xlarge"          then AEC::InstanceType::X116xlarge
      when "x1.32xlarge"          then AEC::InstanceType::X132xlarge
      when "x1e.xlarge"           then AEC::InstanceType::X1eXlarge
      when "x1e.2xlarge"          then AEC::InstanceType::X1e2xlarge
      when "x1e.4xlarge"          then AEC::InstanceType::X1e4xlarge
      when "x1e.8xlarge"          then AEC::InstanceType::X1e8xlarge
      when "x1e.16xlarge"         then AEC::InstanceType::X1e16xlarge
      when "x1e.32xlarge"         then AEC::InstanceType::X1e32xlarge
      when "x2iezn.2xlarge"       then AEC::InstanceType::X2iezn2xlarge
      when "x2iezn.4xlarge"       then AEC::InstanceType::X2iezn4xlarge
      when "x2iezn.6xlarge"       then AEC::InstanceType::X2iezn6xlarge
      when "x2iezn.8xlarge"       then AEC::InstanceType::X2iezn8xlarge
      when "x2iezn.12xlarge"      then AEC::InstanceType::X2iezn12xlarge
      when "x2iezn.metal"         then AEC::InstanceType::X2ieznMetal
      when "x2gd.medium"          then AEC::InstanceType::X2gdMedium
      when "x2gd.large"           then AEC::InstanceType::X2gdLarge
      when "x2gd.xlarge"          then AEC::InstanceType::X2gdXlarge
      when "x2gd.2xlarge"         then AEC::InstanceType::X2gd2xlarge
      when "x2gd.4xlarge"         then AEC::InstanceType::X2gd4xlarge
      when "x2gd.8xlarge"         then AEC::InstanceType::X2gd8xlarge
      when "x2gd.12xlarge"        then AEC::InstanceType::X2gd12xlarge
      when "x2gd.16xlarge"        then AEC::InstanceType::X2gd16xlarge
      when "x2gd.metal"           then AEC::InstanceType::X2gdMetal
      when "z1d.large"            then AEC::InstanceType::Z1dLarge
      when "z1d.xlarge"           then AEC::InstanceType::Z1dXlarge
      when "z1d.2xlarge"          then AEC::InstanceType::Z1d2xlarge
      when "z1d.3xlarge"          then AEC::InstanceType::Z1d3xlarge
      when "z1d.6xlarge"          then AEC::InstanceType::Z1d6xlarge
      when "z1d.12xlarge"         then AEC::InstanceType::Z1d12xlarge
      when "z1d.metal"            then AEC::InstanceType::Z1dMetal
      when "x2idn.16xlarge"       then AEC::InstanceType::X2idn16xlarge
      when "x2idn.24xlarge"       then AEC::InstanceType::X2idn24xlarge
      when "x2idn.32xlarge"       then AEC::InstanceType::X2idn32xlarge
      when "x2iedn.xlarge"        then AEC::InstanceType::X2iednXlarge
      when "x2iedn.2xlarge"       then AEC::InstanceType::X2iedn2xlarge
      when "x2iedn.4xlarge"       then AEC::InstanceType::X2iedn4xlarge
      when "x2iedn.8xlarge"       then AEC::InstanceType::X2iedn8xlarge
      when "x2iedn.16xlarge"      then AEC::InstanceType::X2iedn16xlarge
      when "x2iedn.24xlarge"      then AEC::InstanceType::X2iedn24xlarge
      when "x2iedn.32xlarge"      then AEC::InstanceType::X2iedn32xlarge
      when "c6a.large"            then AEC::InstanceType::C6aLarge
      when "c6a.xlarge"           then AEC::InstanceType::C6aXlarge
      when "c6a.2xlarge"          then AEC::InstanceType::C6a2xlarge
      when "c6a.4xlarge"          then AEC::InstanceType::C6a4xlarge
      when "c6a.8xlarge"          then AEC::InstanceType::C6a8xlarge
      when "c6a.12xlarge"         then AEC::InstanceType::C6a12xlarge
      when "c6a.16xlarge"         then AEC::InstanceType::C6a16xlarge
      when "c6a.24xlarge"         then AEC::InstanceType::C6a24xlarge
      when "c6a.32xlarge"         then AEC::InstanceType::C6a32xlarge
      when "c6a.48xlarge"         then AEC::InstanceType::C6a48xlarge
      when "c6a.metal"            then AEC::InstanceType::C6aMetal
      when "m6a.metal"            then AEC::InstanceType::M6aMetal
      when "i4i.large"            then AEC::InstanceType::I4iLarge
      when "i4i.xlarge"           then AEC::InstanceType::I4iXlarge
      when "i4i.2xlarge"          then AEC::InstanceType::I4i2xlarge
      when "i4i.4xlarge"          then AEC::InstanceType::I4i4xlarge
      when "i4i.8xlarge"          then AEC::InstanceType::I4i8xlarge
      when "i4i.16xlarge"         then AEC::InstanceType::I4i16xlarge
      when "i4i.32xlarge"         then AEC::InstanceType::I4i32xlarge
      when "i4i.metal"            then AEC::InstanceType::I4iMetal
      when "x2idn.metal"          then AEC::InstanceType::X2idnMetal
      when "x2iedn.metal"         then AEC::InstanceType::X2iednMetal
      when "c7g.medium"           then AEC::InstanceType::C7gMedium
      when "c7g.large"            then AEC::InstanceType::C7gLarge
      when "c7g.xlarge"           then AEC::InstanceType::C7gXlarge
      when "c7g.2xlarge"          then AEC::InstanceType::C7g2xlarge
      when "c7g.4xlarge"          then AEC::InstanceType::C7g4xlarge
      when "c7g.8xlarge"          then AEC::InstanceType::C7g8xlarge
      when "c7g.12xlarge"         then AEC::InstanceType::C7g12xlarge
      when "c7g.16xlarge"         then AEC::InstanceType::C7g16xlarge
      when "mac2.metal"           then AEC::InstanceType::Mac2Metal
      when "c6id.large"           then AEC::InstanceType::C6idLarge
      when "c6id.xlarge"          then AEC::InstanceType::C6idXlarge
      when "c6id.2xlarge"         then AEC::InstanceType::C6id2xlarge
      when "c6id.4xlarge"         then AEC::InstanceType::C6id4xlarge
      when "c6id.8xlarge"         then AEC::InstanceType::C6id8xlarge
      when "c6id.12xlarge"        then AEC::InstanceType::C6id12xlarge
      when "c6id.16xlarge"        then AEC::InstanceType::C6id16xlarge
      when "c6id.24xlarge"        then AEC::InstanceType::C6id24xlarge
      when "c6id.32xlarge"        then AEC::InstanceType::C6id32xlarge
      when "c6id.metal"           then AEC::InstanceType::C6idMetal
      when "m6id.large"           then AEC::InstanceType::M6idLarge
      when "m6id.xlarge"          then AEC::InstanceType::M6idXlarge
      when "m6id.2xlarge"         then AEC::InstanceType::M6id2xlarge
      when "m6id.4xlarge"         then AEC::InstanceType::M6id4xlarge
      when "m6id.8xlarge"         then AEC::InstanceType::M6id8xlarge
      when "m6id.12xlarge"        then AEC::InstanceType::M6id12xlarge
      when "m6id.16xlarge"        then AEC::InstanceType::M6id16xlarge
      when "m6id.24xlarge"        then AEC::InstanceType::M6id24xlarge
      when "m6id.32xlarge"        then AEC::InstanceType::M6id32xlarge
      when "m6id.metal"           then AEC::InstanceType::M6idMetal
      when "r6id.large"           then AEC::InstanceType::R6idLarge
      when "r6id.xlarge"          then AEC::InstanceType::R6idXlarge
      when "r6id.2xlarge"         then AEC::InstanceType::R6id2xlarge
      when "r6id.4xlarge"         then AEC::InstanceType::R6id4xlarge
      when "r6id.8xlarge"         then AEC::InstanceType::R6id8xlarge
      when "r6id.12xlarge"        then AEC::InstanceType::R6id12xlarge
      when "r6id.16xlarge"        then AEC::InstanceType::R6id16xlarge
      when "r6id.24xlarge"        then AEC::InstanceType::R6id24xlarge
      when "r6id.32xlarge"        then AEC::InstanceType::R6id32xlarge
      when "r6id.metal"           then AEC::InstanceType::R6idMetal
      when "r6a.large"            then AEC::InstanceType::R6aLarge
      when "r6a.xlarge"           then AEC::InstanceType::R6aXlarge
      when "r6a.2xlarge"          then AEC::InstanceType::R6a2xlarge
      when "r6a.4xlarge"          then AEC::InstanceType::R6a4xlarge
      when "r6a.8xlarge"          then AEC::InstanceType::R6a8xlarge
      when "r6a.12xlarge"         then AEC::InstanceType::R6a12xlarge
      when "r6a.16xlarge"         then AEC::InstanceType::R6a16xlarge
      when "r6a.24xlarge"         then AEC::InstanceType::R6a24xlarge
      when "r6a.32xlarge"         then AEC::InstanceType::R6a32xlarge
      when "r6a.48xlarge"         then AEC::InstanceType::R6a48xlarge
      when "r6a.metal"            then AEC::InstanceType::R6aMetal
      when "p4de.24xlarge"        then AEC::InstanceType::P4de24xlarge
      when "u-3tb1.56xlarge"      then AEC::InstanceType::U3tb156xlarge
      when "u-18tb1.112xlarge"    then AEC::InstanceType::U18tb1112xlarge
      when "u-24tb1.112xlarge"    then AEC::InstanceType::U24tb1112xlarge
      when "trn1.2xlarge"         then AEC::InstanceType::Trn12xlarge
      when "trn1.32xlarge"        then AEC::InstanceType::Trn132xlarge
      when "hpc6id.32xlarge"      then AEC::InstanceType::Hpc6id32xlarge
      when "c6in.large"           then AEC::InstanceType::C6inLarge
      when "c6in.xlarge"          then AEC::InstanceType::C6inXlarge
      when "c6in.2xlarge"         then AEC::InstanceType::C6in2xlarge
      when "c6in.4xlarge"         then AEC::InstanceType::C6in4xlarge
      when "c6in.8xlarge"         then AEC::InstanceType::C6in8xlarge
      when "c6in.12xlarge"        then AEC::InstanceType::C6in12xlarge
      when "c6in.16xlarge"        then AEC::InstanceType::C6in16xlarge
      when "c6in.24xlarge"        then AEC::InstanceType::C6in24xlarge
      when "c6in.32xlarge"        then AEC::InstanceType::C6in32xlarge
      when "m6in.large"           then AEC::InstanceType::M6inLarge
      when "m6in.xlarge"          then AEC::InstanceType::M6inXlarge
      when "m6in.2xlarge"         then AEC::InstanceType::M6in2xlarge
      when "m6in.4xlarge"         then AEC::InstanceType::M6in4xlarge
      when "m6in.8xlarge"         then AEC::InstanceType::M6in8xlarge
      when "m6in.12xlarge"        then AEC::InstanceType::M6in12xlarge
      when "m6in.16xlarge"        then AEC::InstanceType::M6in16xlarge
      when "m6in.24xlarge"        then AEC::InstanceType::M6in24xlarge
      when "m6in.32xlarge"        then AEC::InstanceType::M6in32xlarge
      when "m6idn.large"          then AEC::InstanceType::M6idnLarge
      when "m6idn.xlarge"         then AEC::InstanceType::M6idnXlarge
      when "m6idn.2xlarge"        then AEC::InstanceType::M6idn2xlarge
      when "m6idn.4xlarge"        then AEC::InstanceType::M6idn4xlarge
      when "m6idn.8xlarge"        then AEC::InstanceType::M6idn8xlarge
      when "m6idn.12xlarge"       then AEC::InstanceType::M6idn12xlarge
      when "m6idn.16xlarge"       then AEC::InstanceType::M6idn16xlarge
      when "m6idn.24xlarge"       then AEC::InstanceType::M6idn24xlarge
      when "m6idn.32xlarge"       then AEC::InstanceType::M6idn32xlarge
      when "r6in.large"           then AEC::InstanceType::R6inLarge
      when "r6in.xlarge"          then AEC::InstanceType::R6inXlarge
      when "r6in.2xlarge"         then AEC::InstanceType::R6in2xlarge
      when "r6in.4xlarge"         then AEC::InstanceType::R6in4xlarge
      when "r6in.8xlarge"         then AEC::InstanceType::R6in8xlarge
      when "r6in.12xlarge"        then AEC::InstanceType::R6in12xlarge
      when "r6in.16xlarge"        then AEC::InstanceType::R6in16xlarge
      when "r6in.24xlarge"        then AEC::InstanceType::R6in24xlarge
      when "r6in.32xlarge"        then AEC::InstanceType::R6in32xlarge
      when "r6idn.large"          then AEC::InstanceType::R6idnLarge
      when "r6idn.xlarge"         then AEC::InstanceType::R6idnXlarge
      when "r6idn.2xlarge"        then AEC::InstanceType::R6idn2xlarge
      when "r6idn.4xlarge"        then AEC::InstanceType::R6idn4xlarge
      when "r6idn.8xlarge"        then AEC::InstanceType::R6idn8xlarge
      when "r6idn.12xlarge"       then AEC::InstanceType::R6idn12xlarge
      when "r6idn.16xlarge"       then AEC::InstanceType::R6idn16xlarge
      when "r6idn.24xlarge"       then AEC::InstanceType::R6idn24xlarge
      when "r6idn.32xlarge"       then AEC::InstanceType::R6idn32xlarge
      when "c7g.metal"            then AEC::InstanceType::C7gMetal
      when "m7g.medium"           then AEC::InstanceType::M7gMedium
      when "m7g.large"            then AEC::InstanceType::M7gLarge
      when "m7g.xlarge"           then AEC::InstanceType::M7gXlarge
      when "m7g.2xlarge"          then AEC::InstanceType::M7g2xlarge
      when "m7g.4xlarge"          then AEC::InstanceType::M7g4xlarge
      when "m7g.8xlarge"          then AEC::InstanceType::M7g8xlarge
      when "m7g.12xlarge"         then AEC::InstanceType::M7g12xlarge
      when "m7g.16xlarge"         then AEC::InstanceType::M7g16xlarge
      when "m7g.metal"            then AEC::InstanceType::M7gMetal
      when "r7g.medium"           then AEC::InstanceType::R7gMedium
      when "r7g.large"            then AEC::InstanceType::R7gLarge
      when "r7g.xlarge"           then AEC::InstanceType::R7gXlarge
      when "r7g.2xlarge"          then AEC::InstanceType::R7g2xlarge
      when "r7g.4xlarge"          then AEC::InstanceType::R7g4xlarge
      when "r7g.8xlarge"          then AEC::InstanceType::R7g8xlarge
      when "r7g.12xlarge"         then AEC::InstanceType::R7g12xlarge
      when "r7g.16xlarge"         then AEC::InstanceType::R7g16xlarge
      when "r7g.metal"            then AEC::InstanceType::R7gMetal
      when "c6in.metal"           then AEC::InstanceType::C6inMetal
      when "m6in.metal"           then AEC::InstanceType::M6inMetal
      when "m6idn.metal"          then AEC::InstanceType::M6idnMetal
      when "r6in.metal"           then AEC::InstanceType::R6inMetal
      when "r6idn.metal"          then AEC::InstanceType::R6idnMetal
      when "inf2.xlarge"          then AEC::InstanceType::Inf2Xlarge
      when "inf2.8xlarge"         then AEC::InstanceType::Inf28xlarge
      when "inf2.24xlarge"        then AEC::InstanceType::Inf224xlarge
      when "inf2.48xlarge"        then AEC::InstanceType::Inf248xlarge
      when "trn1n.32xlarge"       then AEC::InstanceType::Trn1n32xlarge
      when "i4g.large"            then AEC::InstanceType::I4gLarge
      when "i4g.xlarge"           then AEC::InstanceType::I4gXlarge
      when "i4g.2xlarge"          then AEC::InstanceType::I4g2xlarge
      when "i4g.4xlarge"          then AEC::InstanceType::I4g4xlarge
      when "i4g.8xlarge"          then AEC::InstanceType::I4g8xlarge
      when "i4g.16xlarge"         then AEC::InstanceType::I4g16xlarge
      when "hpc7g.4xlarge"        then AEC::InstanceType::Hpc7g4xlarge
      when "hpc7g.8xlarge"        then AEC::InstanceType::Hpc7g8xlarge
      when "hpc7g.16xlarge"       then AEC::InstanceType::Hpc7g16xlarge
      when "c7gn.medium"          then AEC::InstanceType::C7gnMedium
      when "c7gn.large"           then AEC::InstanceType::C7gnLarge
      when "c7gn.xlarge"          then AEC::InstanceType::C7gnXlarge
      when "c7gn.2xlarge"         then AEC::InstanceType::C7gn2xlarge
      when "c7gn.4xlarge"         then AEC::InstanceType::C7gn4xlarge
      when "c7gn.8xlarge"         then AEC::InstanceType::C7gn8xlarge
      when "c7gn.12xlarge"        then AEC::InstanceType::C7gn12xlarge
      when "c7gn.16xlarge"        then AEC::InstanceType::C7gn16xlarge
      when "p5.48xlarge"          then AEC::InstanceType::P548xlarge
      when "m7i.large"            then AEC::InstanceType::M7iLarge
      when "m7i.xlarge"           then AEC::InstanceType::M7iXlarge
      when "m7i.2xlarge"          then AEC::InstanceType::M7i2xlarge
      when "m7i.4xlarge"          then AEC::InstanceType::M7i4xlarge
      when "m7i.8xlarge"          then AEC::InstanceType::M7i8xlarge
      when "m7i.12xlarge"         then AEC::InstanceType::M7i12xlarge
      when "m7i.16xlarge"         then AEC::InstanceType::M7i16xlarge
      when "m7i.24xlarge"         then AEC::InstanceType::M7i24xlarge
      when "m7i.48xlarge"         then AEC::InstanceType::M7i48xlarge
      when "m7i-flex.large"       then AEC::InstanceType::M7iFlexLarge
      when "m7i-flex.xlarge"      then AEC::InstanceType::M7iFlexXlarge
      when "m7i-flex.2xlarge"     then AEC::InstanceType::M7iFlex2xlarge
      when "m7i-flex.4xlarge"     then AEC::InstanceType::M7iFlex4xlarge
      when "m7i-flex.8xlarge"     then AEC::InstanceType::M7iFlex8xlarge
      when "m7a.medium"           then AEC::InstanceType::M7aMedium
      when "m7a.large"            then AEC::InstanceType::M7aLarge
      when "m7a.xlarge"           then AEC::InstanceType::M7aXlarge
      when "m7a.2xlarge"          then AEC::InstanceType::M7a2xlarge
      when "m7a.4xlarge"          then AEC::InstanceType::M7a4xlarge
      when "m7a.8xlarge"          then AEC::InstanceType::M7a8xlarge
      when "m7a.12xlarge"         then AEC::InstanceType::M7a12xlarge
      when "m7a.16xlarge"         then AEC::InstanceType::M7a16xlarge
      when "m7a.24xlarge"         then AEC::InstanceType::M7a24xlarge
      when "m7a.32xlarge"         then AEC::InstanceType::M7a32xlarge
      when "m7a.48xlarge"         then AEC::InstanceType::M7a48xlarge
      when "m7a.metal-48xl"       then AEC::InstanceType::M7aMetal48xl
      when "hpc7a.12xlarge"       then AEC::InstanceType::Hpc7a12xlarge
      when "hpc7a.24xlarge"       then AEC::InstanceType::Hpc7a24xlarge
      when "hpc7a.48xlarge"       then AEC::InstanceType::Hpc7a48xlarge
      when "hpc7a.96xlarge"       then AEC::InstanceType::Hpc7a96xlarge
      when "c7gd.medium"          then AEC::InstanceType::C7gdMedium
      when "c7gd.large"           then AEC::InstanceType::C7gdLarge
      when "c7gd.xlarge"          then AEC::InstanceType::C7gdXlarge
      when "c7gd.2xlarge"         then AEC::InstanceType::C7gd2xlarge
      when "c7gd.4xlarge"         then AEC::InstanceType::C7gd4xlarge
      when "c7gd.8xlarge"         then AEC::InstanceType::C7gd8xlarge
      when "c7gd.12xlarge"        then AEC::InstanceType::C7gd12xlarge
      when "c7gd.16xlarge"        then AEC::InstanceType::C7gd16xlarge
      when "m7gd.medium"          then AEC::InstanceType::M7gdMedium
      when "m7gd.large"           then AEC::InstanceType::M7gdLarge
      when "m7gd.xlarge"          then AEC::InstanceType::M7gdXlarge
      when "m7gd.2xlarge"         then AEC::InstanceType::M7gd2xlarge
      when "m7gd.4xlarge"         then AEC::InstanceType::M7gd4xlarge
      when "m7gd.8xlarge"         then AEC::InstanceType::M7gd8xlarge
      when "m7gd.12xlarge"        then AEC::InstanceType::M7gd12xlarge
      when "m7gd.16xlarge"        then AEC::InstanceType::M7gd16xlarge
      when "r7gd.medium"          then AEC::InstanceType::R7gdMedium
      when "r7gd.large"           then AEC::InstanceType::R7gdLarge
      when "r7gd.xlarge"          then AEC::InstanceType::R7gdXlarge
      when "r7gd.2xlarge"         then AEC::InstanceType::R7gd2xlarge
      when "r7gd.4xlarge"         then AEC::InstanceType::R7gd4xlarge
      when "r7gd.8xlarge"         then AEC::InstanceType::R7gd8xlarge
      when "r7gd.12xlarge"        then AEC::InstanceType::R7gd12xlarge
      when "r7gd.16xlarge"        then AEC::InstanceType::R7gd16xlarge
      when "r7a.medium"           then AEC::InstanceType::R7aMedium
      when "r7a.large"            then AEC::InstanceType::R7aLarge
      when "r7a.xlarge"           then AEC::InstanceType::R7aXlarge
      when "r7a.2xlarge"          then AEC::InstanceType::R7a2xlarge
      when "r7a.4xlarge"          then AEC::InstanceType::R7a4xlarge
      when "r7a.8xlarge"          then AEC::InstanceType::R7a8xlarge
      when "r7a.12xlarge"         then AEC::InstanceType::R7a12xlarge
      when "r7a.16xlarge"         then AEC::InstanceType::R7a16xlarge
      when "r7a.24xlarge"         then AEC::InstanceType::R7a24xlarge
      when "r7a.32xlarge"         then AEC::InstanceType::R7a32xlarge
      when "r7a.48xlarge"         then AEC::InstanceType::R7a48xlarge
      when "c7i.large"            then AEC::InstanceType::C7iLarge
      when "c7i.xlarge"           then AEC::InstanceType::C7iXlarge
      when "c7i.2xlarge"          then AEC::InstanceType::C7i2xlarge
      when "c7i.4xlarge"          then AEC::InstanceType::C7i4xlarge
      when "c7i.8xlarge"          then AEC::InstanceType::C7i8xlarge
      when "c7i.12xlarge"         then AEC::InstanceType::C7i12xlarge
      when "c7i.16xlarge"         then AEC::InstanceType::C7i16xlarge
      when "c7i.24xlarge"         then AEC::InstanceType::C7i24xlarge
      when "c7i.48xlarge"         then AEC::InstanceType::C7i48xlarge
      when "mac2-m2pro.metal"     then AEC::InstanceType::Mac2M2proMetal
      when "r7iz.large"           then AEC::InstanceType::R7izLarge
      when "r7iz.xlarge"          then AEC::InstanceType::R7izXlarge
      when "r7iz.2xlarge"         then AEC::InstanceType::R7iz2xlarge
      when "r7iz.4xlarge"         then AEC::InstanceType::R7iz4xlarge
      when "r7iz.8xlarge"         then AEC::InstanceType::R7iz8xlarge
      when "r7iz.12xlarge"        then AEC::InstanceType::R7iz12xlarge
      when "r7iz.16xlarge"        then AEC::InstanceType::R7iz16xlarge
      when "r7iz.32xlarge"        then AEC::InstanceType::R7iz32xlarge
      when "c7a.medium"           then AEC::InstanceType::C7aMedium
      when "c7a.large"            then AEC::InstanceType::C7aLarge
      when "c7a.xlarge"           then AEC::InstanceType::C7aXlarge
      when "c7a.2xlarge"          then AEC::InstanceType::C7a2xlarge
      when "c7a.4xlarge"          then AEC::InstanceType::C7a4xlarge
      when "c7a.8xlarge"          then AEC::InstanceType::C7a8xlarge
      when "c7a.12xlarge"         then AEC::InstanceType::C7a12xlarge
      when "c7a.16xlarge"         then AEC::InstanceType::C7a16xlarge
      when "c7a.24xlarge"         then AEC::InstanceType::C7a24xlarge
      when "c7a.32xlarge"         then AEC::InstanceType::C7a32xlarge
      when "c7a.48xlarge"         then AEC::InstanceType::C7a48xlarge
      when "c7a.metal-48xl"       then AEC::InstanceType::C7aMetal48xl
      when "r7a.metal-48xl"       then AEC::InstanceType::R7aMetal48xl
      when "r7i.large"            then AEC::InstanceType::R7iLarge
      when "r7i.xlarge"           then AEC::InstanceType::R7iXlarge
      when "r7i.2xlarge"          then AEC::InstanceType::R7i2xlarge
      when "r7i.4xlarge"          then AEC::InstanceType::R7i4xlarge
      when "r7i.8xlarge"          then AEC::InstanceType::R7i8xlarge
      when "r7i.12xlarge"         then AEC::InstanceType::R7i12xlarge
      when "r7i.16xlarge"         then AEC::InstanceType::R7i16xlarge
      when "r7i.24xlarge"         then AEC::InstanceType::R7i24xlarge
      when "r7i.48xlarge"         then AEC::InstanceType::R7i48xlarge
      when "dl2q.24xlarge"        then AEC::InstanceType::Dl2q24xlarge
      when "mac2-m2.metal"        then AEC::InstanceType::Mac2M2Metal
      when "i4i.12xlarge"         then AEC::InstanceType::I4i12xlarge
      when "i4i.24xlarge"         then AEC::InstanceType::I4i24xlarge
      when "c7i.metal-24xl"       then AEC::InstanceType::C7iMetal24xl
      when "c7i.metal-48xl"       then AEC::InstanceType::C7iMetal48xl
      when "m7i.metal-24xl"       then AEC::InstanceType::M7iMetal24xl
      when "m7i.metal-48xl"       then AEC::InstanceType::M7iMetal48xl
      when "r7i.metal-24xl"       then AEC::InstanceType::R7iMetal24xl
      when "r7i.metal-48xl"       then AEC::InstanceType::R7iMetal48xl
      when "r7iz.metal-16xl"      then AEC::InstanceType::R7izMetal16xl
      when "r7iz.metal-32xl"      then AEC::InstanceType::R7izMetal32xl
      when "c7gd.metal"           then AEC::InstanceType::C7gdMetal
      when "m7gd.metal"           then AEC::InstanceType::M7gdMetal
      when "r7gd.metal"           then AEC::InstanceType::R7gdMetal
      when "g6.xlarge"            then AEC::InstanceType::G6Xlarge
      when "g6.2xlarge"           then AEC::InstanceType::G62xlarge
      when "g6.4xlarge"           then AEC::InstanceType::G64xlarge
      when "g6.8xlarge"           then AEC::InstanceType::G68xlarge
      when "g6.12xlarge"          then AEC::InstanceType::G612xlarge
      when "g6.16xlarge"          then AEC::InstanceType::G616xlarge
      when "g6.24xlarge"          then AEC::InstanceType::G624xlarge
      when "g6.48xlarge"          then AEC::InstanceType::G648xlarge
      when "gr6.4xlarge"          then AEC::InstanceType::Gr64xlarge
      when "gr6.8xlarge"          then AEC::InstanceType::Gr68xlarge
      when "c7i-flex.large"       then AEC::InstanceType::C7iFlexLarge
      when "c7i-flex.xlarge"      then AEC::InstanceType::C7iFlexXlarge
      when "c7i-flex.2xlarge"     then AEC::InstanceType::C7iFlex2xlarge
      when "c7i-flex.4xlarge"     then AEC::InstanceType::C7iFlex4xlarge
      when "c7i-flex.8xlarge"     then AEC::InstanceType::C7iFlex8xlarge
      when "u7i-12tb.224xlarge"   then AEC::InstanceType::U7i12tb224xlarge
      when "u7in-16tb.224xlarge"  then AEC::InstanceType::U7in16tb224xlarge
      when "u7in-24tb.224xlarge"  then AEC::InstanceType::U7in24tb224xlarge
      when "u7in-32tb.224xlarge"  then AEC::InstanceType::U7in32tb224xlarge
      when "u7ib-12tb.224xlarge"  then AEC::InstanceType::U7ib12tb224xlarge
      when "c7gn.metal"           then AEC::InstanceType::C7gnMetal
      when "r8g.medium"           then AEC::InstanceType::R8gMedium
      when "r8g.large"            then AEC::InstanceType::R8gLarge
      when "r8g.xlarge"           then AEC::InstanceType::R8gXlarge
      when "r8g.2xlarge"          then AEC::InstanceType::R8g2xlarge
      when "r8g.4xlarge"          then AEC::InstanceType::R8g4xlarge
      when "r8g.8xlarge"          then AEC::InstanceType::R8g8xlarge
      when "r8g.12xlarge"         then AEC::InstanceType::R8g12xlarge
      when "r8g.16xlarge"         then AEC::InstanceType::R8g16xlarge
      when "r8g.24xlarge"         then AEC::InstanceType::R8g24xlarge
      when "r8g.48xlarge"         then AEC::InstanceType::R8g48xlarge
      when "r8g.metal-24xl"       then AEC::InstanceType::R8gMetal24xl
      when "r8g.metal-48xl"       then AEC::InstanceType::R8gMetal48xl
      when "mac2-m1ultra.metal"   then AEC::InstanceType::Mac2M1ultraMetal
      when "g6e.xlarge"           then AEC::InstanceType::G6eXlarge
      when "g6e.2xlarge"          then AEC::InstanceType::G6e2xlarge
      when "g6e.4xlarge"          then AEC::InstanceType::G6e4xlarge
      when "g6e.8xlarge"          then AEC::InstanceType::G6e8xlarge
      when "g6e.12xlarge"         then AEC::InstanceType::G6e12xlarge
      when "g6e.16xlarge"         then AEC::InstanceType::G6e16xlarge
      when "g6e.24xlarge"         then AEC::InstanceType::G6e24xlarge
      when "g6e.48xlarge"         then AEC::InstanceType::G6e48xlarge
      when "c8g.medium"           then AEC::InstanceType::C8gMedium
      when "c8g.large"            then AEC::InstanceType::C8gLarge
      when "c8g.xlarge"           then AEC::InstanceType::C8gXlarge
      when "c8g.2xlarge"          then AEC::InstanceType::C8g2xlarge
      when "c8g.4xlarge"          then AEC::InstanceType::C8g4xlarge
      when "c8g.8xlarge"          then AEC::InstanceType::C8g8xlarge
      when "c8g.12xlarge"         then AEC::InstanceType::C8g12xlarge
      when "c8g.16xlarge"         then AEC::InstanceType::C8g16xlarge
      when "c8g.24xlarge"         then AEC::InstanceType::C8g24xlarge
      when "c8g.48xlarge"         then AEC::InstanceType::C8g48xlarge
      when "c8g.metal-24xl"       then AEC::InstanceType::C8gMetal24xl
      when "c8g.metal-48xl"       then AEC::InstanceType::C8gMetal48xl
      when "m8g.medium"           then AEC::InstanceType::M8gMedium
      when "m8g.large"            then AEC::InstanceType::M8gLarge
      when "m8g.xlarge"           then AEC::InstanceType::M8gXlarge
      when "m8g.2xlarge"          then AEC::InstanceType::M8g2xlarge
      when "m8g.4xlarge"          then AEC::InstanceType::M8g4xlarge
      when "m8g.8xlarge"          then AEC::InstanceType::M8g8xlarge
      when "m8g.12xlarge"         then AEC::InstanceType::M8g12xlarge
      when "m8g.16xlarge"         then AEC::InstanceType::M8g16xlarge
      when "m8g.24xlarge"         then AEC::InstanceType::M8g24xlarge
      when "m8g.48xlarge"         then AEC::InstanceType::M8g48xlarge
      when "m8g.metal-24xl"       then AEC::InstanceType::M8gMetal24xl
      when "m8g.metal-48xl"       then AEC::InstanceType::M8gMetal48xl
      when "x8g.medium"           then AEC::InstanceType::X8gMedium
      when "x8g.large"            then AEC::InstanceType::X8gLarge
      when "x8g.xlarge"           then AEC::InstanceType::X8gXlarge
      when "x8g.2xlarge"          then AEC::InstanceType::X8g2xlarge
      when "x8g.4xlarge"          then AEC::InstanceType::X8g4xlarge
      when "x8g.8xlarge"          then AEC::InstanceType::X8g8xlarge
      when "x8g.12xlarge"         then AEC::InstanceType::X8g12xlarge
      when "x8g.16xlarge"         then AEC::InstanceType::X8g16xlarge
      when "x8g.24xlarge"         then AEC::InstanceType::X8g24xlarge
      when "x8g.48xlarge"         then AEC::InstanceType::X8g48xlarge
      when "x8g.metal-24xl"       then AEC::InstanceType::X8gMetal24xl
      when "x8g.metal-48xl"       then AEC::InstanceType::X8gMetal48xl
      when "i7ie.large"           then AEC::InstanceType::I7ieLarge
      when "i7ie.xlarge"          then AEC::InstanceType::I7ieXlarge
      when "i7ie.2xlarge"         then AEC::InstanceType::I7ie2xlarge
      when "i7ie.3xlarge"         then AEC::InstanceType::I7ie3xlarge
      when "i7ie.6xlarge"         then AEC::InstanceType::I7ie6xlarge
      when "i7ie.12xlarge"        then AEC::InstanceType::I7ie12xlarge
      when "i7ie.18xlarge"        then AEC::InstanceType::I7ie18xlarge
      when "i7ie.24xlarge"        then AEC::InstanceType::I7ie24xlarge
      when "i7ie.48xlarge"        then AEC::InstanceType::I7ie48xlarge
      when "i8g.large"            then AEC::InstanceType::I8gLarge
      when "i8g.xlarge"           then AEC::InstanceType::I8gXlarge
      when "i8g.2xlarge"          then AEC::InstanceType::I8g2xlarge
      when "i8g.4xlarge"          then AEC::InstanceType::I8g4xlarge
      when "i8g.8xlarge"          then AEC::InstanceType::I8g8xlarge
      when "i8g.12xlarge"         then AEC::InstanceType::I8g12xlarge
      when "i8g.16xlarge"         then AEC::InstanceType::I8g16xlarge
      when "i8g.24xlarge"         then AEC::InstanceType::I8g24xlarge
      when "i8g.metal-24xl"       then AEC::InstanceType::I8gMetal24xl
      when "u7i-6tb.112xlarge"    then AEC::InstanceType::U7i6tb112xlarge
      when "u7i-8tb.112xlarge"    then AEC::InstanceType::U7i8tb112xlarge
      when "u7inh-32tb.480xlarge" then AEC::InstanceType::U7inh32tb480xlarge
      when "p5e.48xlarge"         then AEC::InstanceType::P5e48xlarge
      when "p5en.48xlarge"        then AEC::InstanceType::P5en48xlarge
      when "f2.12xlarge"          then AEC::InstanceType::F212xlarge
      when "f2.48xlarge"          then AEC::InstanceType::F248xlarge
      when "trn2.48xlarge"        then AEC::InstanceType::Trn248xlarge
      when "c7i-flex.12xlarge"    then AEC::InstanceType::C7iFlex12xlarge
      when "c7i-flex.16xlarge"    then AEC::InstanceType::C7iFlex16xlarge
      when "m7i-flex.12xlarge"    then AEC::InstanceType::M7iFlex12xlarge
      when "m7i-flex.16xlarge"    then AEC::InstanceType::M7iFlex16xlarge
      when "i7ie.metal-24xl"      then AEC::InstanceType::I7ieMetal24xl
      when "i7ie.metal-48xl"      then AEC::InstanceType::I7ieMetal48xl
      when "i8g.48xlarge"         then AEC::InstanceType::I8g48xlarge
      when "c8gd.medium"          then AEC::InstanceType::C8gdMedium
      when "c8gd.large"           then AEC::InstanceType::C8gdLarge
      when "c8gd.xlarge"          then AEC::InstanceType::C8gdXlarge
      when "c8gd.2xlarge"         then AEC::InstanceType::C8gd2xlarge
      when "c8gd.4xlarge"         then AEC::InstanceType::C8gd4xlarge
      when "c8gd.8xlarge"         then AEC::InstanceType::C8gd8xlarge
      when "c8gd.12xlarge"        then AEC::InstanceType::C8gd12xlarge
      when "c8gd.16xlarge"        then AEC::InstanceType::C8gd16xlarge
      when "c8gd.24xlarge"        then AEC::InstanceType::C8gd24xlarge
      when "c8gd.48xlarge"        then AEC::InstanceType::C8gd48xlarge
      when "c8gd.metal-24xl"      then AEC::InstanceType::C8gdMetal24xl
      when "c8gd.metal-48xl"      then AEC::InstanceType::C8gdMetal48xl
      when "i7i.large"            then AEC::InstanceType::I7iLarge
      when "i7i.xlarge"           then AEC::InstanceType::I7iXlarge
      when "i7i.2xlarge"          then AEC::InstanceType::I7i2xlarge
      when "i7i.4xlarge"          then AEC::InstanceType::I7i4xlarge
      when "i7i.8xlarge"          then AEC::InstanceType::I7i8xlarge
      when "i7i.12xlarge"         then AEC::InstanceType::I7i12xlarge
      when "i7i.16xlarge"         then AEC::InstanceType::I7i16xlarge
      when "i7i.24xlarge"         then AEC::InstanceType::I7i24xlarge
      when "i7i.48xlarge"         then AEC::InstanceType::I7i48xlarge
      when "i7i.metal-24xl"       then AEC::InstanceType::I7iMetal24xl
      when "i7i.metal-48xl"       then AEC::InstanceType::I7iMetal48xl
      when "p6-b200.48xlarge"     then AEC::InstanceType::P6B20048xlarge
      when "m8gd.medium"          then AEC::InstanceType::M8gdMedium
      when "m8gd.large"           then AEC::InstanceType::M8gdLarge
      when "m8gd.xlarge"          then AEC::InstanceType::M8gdXlarge
      when "m8gd.2xlarge"         then AEC::InstanceType::M8gd2xlarge
      when "m8gd.4xlarge"         then AEC::InstanceType::M8gd4xlarge
      when "m8gd.8xlarge"         then AEC::InstanceType::M8gd8xlarge
      when "m8gd.12xlarge"        then AEC::InstanceType::M8gd12xlarge
      when "m8gd.16xlarge"        then AEC::InstanceType::M8gd16xlarge
      when "m8gd.24xlarge"        then AEC::InstanceType::M8gd24xlarge
      when "m8gd.48xlarge"        then AEC::InstanceType::M8gd48xlarge
      when "m8gd.metal-24xl"      then AEC::InstanceType::M8gdMetal24xl
      when "m8gd.metal-48xl"      then AEC::InstanceType::M8gdMetal48xl
      when "r8gd.medium"          then AEC::InstanceType::R8gdMedium
      when "r8gd.large"           then AEC::InstanceType::R8gdLarge
      when "r8gd.xlarge"          then AEC::InstanceType::R8gdXlarge
      when "r8gd.2xlarge"         then AEC::InstanceType::R8gd2xlarge
      when "r8gd.4xlarge"         then AEC::InstanceType::R8gd4xlarge
      when "r8gd.8xlarge"         then AEC::InstanceType::R8gd8xlarge
      when "r8gd.12xlarge"        then AEC::InstanceType::R8gd12xlarge
      when "r8gd.16xlarge"        then AEC::InstanceType::R8gd16xlarge
      when "r8gd.24xlarge"        then AEC::InstanceType::R8gd24xlarge
      when "r8gd.48xlarge"        then AEC::InstanceType::R8gd48xlarge
      when "r8gd.metal-24xl"      then AEC::InstanceType::R8gdMetal24xl
      when "r8gd.metal-48xl"      then AEC::InstanceType::R8gdMetal48xl
      when "c8gn.medium"          then AEC::InstanceType::C8gnMedium
      when "c8gn.large"           then AEC::InstanceType::C8gnLarge
      when "c8gn.xlarge"          then AEC::InstanceType::C8gnXlarge
      when "c8gn.2xlarge"         then AEC::InstanceType::C8gn2xlarge
      when "c8gn.4xlarge"         then AEC::InstanceType::C8gn4xlarge
      when "c8gn.8xlarge"         then AEC::InstanceType::C8gn8xlarge
      when "c8gn.12xlarge"        then AEC::InstanceType::C8gn12xlarge
      when "c8gn.16xlarge"        then AEC::InstanceType::C8gn16xlarge
      when "c8gn.24xlarge"        then AEC::InstanceType::C8gn24xlarge
      when "c8gn.48xlarge"        then AEC::InstanceType::C8gn48xlarge
      when "c8gn.metal-24xl"      then AEC::InstanceType::C8gnMetal24xl
      when "c8gn.metal-48xl"      then AEC::InstanceType::C8gnMetal48xl
      when "f2.6xlarge"           then AEC::InstanceType::F26xlarge
      when "p6e-gb200.36xlarge"   then AEC::InstanceType::P6eGb20036xlarge
      when "g6f.large"            then AEC::InstanceType::G6fLarge
      when "g6f.xlarge"           then AEC::InstanceType::G6fXlarge
      when "g6f.2xlarge"          then AEC::InstanceType::G6f2xlarge
      when "g6f.4xlarge"          then AEC::InstanceType::G6f4xlarge
      when "gr6f.4xlarge"         then AEC::InstanceType::Gr6f4xlarge
      when "p5.4xlarge"           then AEC::InstanceType::P54xlarge
      when "r8i.large"            then AEC::InstanceType::R8iLarge
      when "r8i.xlarge"           then AEC::InstanceType::R8iXlarge
      when "r8i.2xlarge"          then AEC::InstanceType::R8i2xlarge
      when "r8i.4xlarge"          then AEC::InstanceType::R8i4xlarge
      when "r8i.8xlarge"          then AEC::InstanceType::R8i8xlarge
      when "r8i.12xlarge"         then AEC::InstanceType::R8i12xlarge
      when "r8i.16xlarge"         then AEC::InstanceType::R8i16xlarge
      when "r8i.24xlarge"         then AEC::InstanceType::R8i24xlarge
      when "r8i.32xlarge"         then AEC::InstanceType::R8i32xlarge
      when "r8i.48xlarge"         then AEC::InstanceType::R8i48xlarge
      when "r8i.96xlarge"         then AEC::InstanceType::R8i96xlarge
      when "r8i.metal-48xl"       then AEC::InstanceType::R8iMetal48xl
      when "r8i.metal-96xl"       then AEC::InstanceType::R8iMetal96xl
      when "r8i-flex.large"       then AEC::InstanceType::R8iFlexLarge
      when "r8i-flex.xlarge"      then AEC::InstanceType::R8iFlexXlarge
      when "r8i-flex.2xlarge"     then AEC::InstanceType::R8iFlex2xlarge
      when "r8i-flex.4xlarge"     then AEC::InstanceType::R8iFlex4xlarge
      when "r8i-flex.8xlarge"     then AEC::InstanceType::R8iFlex8xlarge
      when "r8i-flex.12xlarge"    then AEC::InstanceType::R8iFlex12xlarge
      when "r8i-flex.16xlarge"    then AEC::InstanceType::R8iFlex16xlarge
      when "m8i.large"            then AEC::InstanceType::M8iLarge
      when "m8i.xlarge"           then AEC::InstanceType::M8iXlarge
      when "m8i.2xlarge"          then AEC::InstanceType::M8i2xlarge
      when "m8i.4xlarge"          then AEC::InstanceType::M8i4xlarge
      when "m8i.8xlarge"          then AEC::InstanceType::M8i8xlarge
      when "m8i.12xlarge"         then AEC::InstanceType::M8i12xlarge
      when "m8i.16xlarge"         then AEC::InstanceType::M8i16xlarge
      when "m8i.24xlarge"         then AEC::InstanceType::M8i24xlarge
      when "m8i.32xlarge"         then AEC::InstanceType::M8i32xlarge
      when "m8i.48xlarge"         then AEC::InstanceType::M8i48xlarge
      when "m8i.96xlarge"         then AEC::InstanceType::M8i96xlarge
      when "m8i.metal-48xl"       then AEC::InstanceType::M8iMetal48xl
      when "m8i.metal-96xl"       then AEC::InstanceType::M8iMetal96xl
      when "m8i-flex.large"       then AEC::InstanceType::M8iFlexLarge
      when "m8i-flex.xlarge"      then AEC::InstanceType::M8iFlexXlarge
      when "m8i-flex.2xlarge"     then AEC::InstanceType::M8iFlex2xlarge
      when "m8i-flex.4xlarge"     then AEC::InstanceType::M8iFlex4xlarge
      when "m8i-flex.8xlarge"     then AEC::InstanceType::M8iFlex8xlarge
      when "m8i-flex.12xlarge"    then AEC::InstanceType::M8iFlex12xlarge
      when "m8i-flex.16xlarge"    then AEC::InstanceType::M8iFlex16xlarge
      when "i8ge.large"           then AEC::InstanceType::I8geLarge
      when "i8ge.xlarge"          then AEC::InstanceType::I8geXlarge
      when "i8ge.2xlarge"         then AEC::InstanceType::I8ge2xlarge
      when "i8ge.3xlarge"         then AEC::InstanceType::I8ge3xlarge
      when "i8ge.6xlarge"         then AEC::InstanceType::I8ge6xlarge
      when "i8ge.12xlarge"        then AEC::InstanceType::I8ge12xlarge
      when "i8ge.18xlarge"        then AEC::InstanceType::I8ge18xlarge
      when "i8ge.24xlarge"        then AEC::InstanceType::I8ge24xlarge
      when "i8ge.48xlarge"        then AEC::InstanceType::I8ge48xlarge
      when "i8ge.metal-24xl"      then AEC::InstanceType::I8geMetal24xl
      when "i8ge.metal-48xl"      then AEC::InstanceType::I8geMetal48xl
      when "mac-m4.metal"         then AEC::InstanceType::MacM4Metal
      when "mac-m4pro.metal"      then AEC::InstanceType::MacM4proMetal
      when "r8gn.medium"          then AEC::InstanceType::R8gnMedium
      when "r8gn.large"           then AEC::InstanceType::R8gnLarge
      when "r8gn.xlarge"          then AEC::InstanceType::R8gnXlarge
      when "r8gn.2xlarge"         then AEC::InstanceType::R8gn2xlarge
      when "r8gn.4xlarge"         then AEC::InstanceType::R8gn4xlarge
      when "r8gn.8xlarge"         then AEC::InstanceType::R8gn8xlarge
      when "r8gn.12xlarge"        then AEC::InstanceType::R8gn12xlarge
      when "r8gn.16xlarge"        then AEC::InstanceType::R8gn16xlarge
      when "r8gn.24xlarge"        then AEC::InstanceType::R8gn24xlarge
      when "r8gn.48xlarge"        then AEC::InstanceType::R8gn48xlarge
      when "r8gn.metal-24xl"      then AEC::InstanceType::R8gnMetal24xl
      when "r8gn.metal-48xl"      then AEC::InstanceType::R8gnMetal48xl
      when "c8i.large"            then AEC::InstanceType::C8iLarge
      when "c8i.xlarge"           then AEC::InstanceType::C8iXlarge
      when "c8i.2xlarge"          then AEC::InstanceType::C8i2xlarge
      when "c8i.4xlarge"          then AEC::InstanceType::C8i4xlarge
      when "c8i.8xlarge"          then AEC::InstanceType::C8i8xlarge
      when "c8i.12xlarge"         then AEC::InstanceType::C8i12xlarge
      when "c8i.16xlarge"         then AEC::InstanceType::C8i16xlarge
      when "c8i.24xlarge"         then AEC::InstanceType::C8i24xlarge
      when "c8i.32xlarge"         then AEC::InstanceType::C8i32xlarge
      when "c8i.48xlarge"         then AEC::InstanceType::C8i48xlarge
      when "c8i.96xlarge"         then AEC::InstanceType::C8i96xlarge
      when "c8i.metal-48xl"       then AEC::InstanceType::C8iMetal48xl
      when "c8i.metal-96xl"       then AEC::InstanceType::C8iMetal96xl
      when "c8i-flex.large"       then AEC::InstanceType::C8iFlexLarge
      when "c8i-flex.xlarge"      then AEC::InstanceType::C8iFlexXlarge
      when "c8i-flex.2xlarge"     then AEC::InstanceType::C8iFlex2xlarge
      when "c8i-flex.4xlarge"     then AEC::InstanceType::C8iFlex4xlarge
      when "c8i-flex.8xlarge"     then AEC::InstanceType::C8iFlex8xlarge
      when "c8i-flex.12xlarge"    then AEC::InstanceType::C8iFlex12xlarge
      when "c8i-flex.16xlarge"    then AEC::InstanceType::C8iFlex16xlarge
      when "r8gb.medium"          then AEC::InstanceType::R8gbMedium
      when "r8gb.large"           then AEC::InstanceType::R8gbLarge
      when "r8gb.xlarge"          then AEC::InstanceType::R8gbXlarge
      when "r8gb.2xlarge"         then AEC::InstanceType::R8gb2xlarge
      when "r8gb.4xlarge"         then AEC::InstanceType::R8gb4xlarge
      when "r8gb.8xlarge"         then AEC::InstanceType::R8gb8xlarge
      when "r8gb.12xlarge"        then AEC::InstanceType::R8gb12xlarge
      when "r8gb.16xlarge"        then AEC::InstanceType::R8gb16xlarge
      when "r8gb.24xlarge"        then AEC::InstanceType::R8gb24xlarge
      when "r8gb.metal-24xl"      then AEC::InstanceType::R8gbMetal24xl
      when "m8a.medium"           then AEC::InstanceType::M8aMedium
      when "m8a.large"            then AEC::InstanceType::M8aLarge
      when "m8a.xlarge"           then AEC::InstanceType::M8aXlarge
      when "m8a.2xlarge"          then AEC::InstanceType::M8a2xlarge
      when "m8a.4xlarge"          then AEC::InstanceType::M8a4xlarge
      when "m8a.8xlarge"          then AEC::InstanceType::M8a8xlarge
      when "m8a.12xlarge"         then AEC::InstanceType::M8a12xlarge
      when "m8a.16xlarge"         then AEC::InstanceType::M8a16xlarge
      when "m8a.24xlarge"         then AEC::InstanceType::M8a24xlarge
      when "m8a.48xlarge"         then AEC::InstanceType::M8a48xlarge
      when "m8a.metal-24xl"       then AEC::InstanceType::M8aMetal24xl
      when "m8a.metal-48xl"       then AEC::InstanceType::M8aMetal48xl
      when "trn2.3xlarge"         then AEC::InstanceType::Trn23xlarge
      when "r8a.medium"           then AEC::InstanceType::R8aMedium
      when "r8a.large"            then AEC::InstanceType::R8aLarge
      when "r8a.xlarge"           then AEC::InstanceType::R8aXlarge
      when "r8a.2xlarge"          then AEC::InstanceType::R8a2xlarge
      when "r8a.4xlarge"          then AEC::InstanceType::R8a4xlarge
      when "r8a.8xlarge"          then AEC::InstanceType::R8a8xlarge
      when "r8a.12xlarge"         then AEC::InstanceType::R8a12xlarge
      when "r8a.16xlarge"         then AEC::InstanceType::R8a16xlarge
      when "r8a.24xlarge"         then AEC::InstanceType::R8a24xlarge
      when "r8a.48xlarge"         then AEC::InstanceType::R8a48xlarge
      when "r8a.metal-24xl"       then AEC::InstanceType::R8aMetal24xl
      when "r8a.metal-48xl"       then AEC::InstanceType::R8aMetal48xl
      when "p6-b300.48xlarge"     then AEC::InstanceType::P6B30048xlarge
      when "c8a.medium"           then AEC::InstanceType::C8aMedium
      when "c8a.large"            then AEC::InstanceType::C8aLarge
      when "c8a.xlarge"           then AEC::InstanceType::C8aXlarge
      when "c8a.2xlarge"          then AEC::InstanceType::C8a2xlarge
      when "c8a.4xlarge"          then AEC::InstanceType::C8a4xlarge
      when "c8a.8xlarge"          then AEC::InstanceType::C8a8xlarge
      when "c8a.12xlarge"         then AEC::InstanceType::C8a12xlarge
      when "c8a.16xlarge"         then AEC::InstanceType::C8a16xlarge
      when "c8a.24xlarge"         then AEC::InstanceType::C8a24xlarge
      when "c8a.48xlarge"         then AEC::InstanceType::C8a48xlarge
      when "c8a.metal-24xl"       then AEC::InstanceType::C8aMetal24xl
      when "c8a.metal-48xl"       then AEC::InstanceType::C8aMetal48xl
      when "c8gb.12xlarge"        then AEC::InstanceType::C8gb12xlarge
      when "c8gb.16xlarge"        then AEC::InstanceType::C8gb16xlarge
      when "c8gb.24xlarge"        then AEC::InstanceType::C8gb24xlarge
      when "c8gb.2xlarge"         then AEC::InstanceType::C8gb2xlarge
      when "c8gb.4xlarge"         then AEC::InstanceType::C8gb4xlarge
      when "c8gb.8xlarge"         then AEC::InstanceType::C8gb8xlarge
      when "c8gb.large"           then AEC::InstanceType::C8gbLarge
      when "c8gb.medium"          then AEC::InstanceType::C8gbMedium
      when "c8gb.metal-24xl"      then AEC::InstanceType::C8gbMetal24xl
      when "c8gb.xlarge"          then AEC::InstanceType::C8gbXlarge
      when "c8gb.48xlarge"        then AEC::InstanceType::C8gb48xlarge
      when "c8gb.metal-48xl"      then AEC::InstanceType::C8gbMetal48xl
      when "m8gb.12xlarge"        then AEC::InstanceType::M8gb12xlarge
      when "m8gb.16xlarge"        then AEC::InstanceType::M8gb16xlarge
      when "m8gb.24xlarge"        then AEC::InstanceType::M8gb24xlarge
      when "m8gb.2xlarge"         then AEC::InstanceType::M8gb2xlarge
      when "m8gb.4xlarge"         then AEC::InstanceType::M8gb4xlarge
      when "m8gb.8xlarge"         then AEC::InstanceType::M8gb8xlarge
      when "m8gb.large"           then AEC::InstanceType::M8gbLarge
      when "m8gb.medium"          then AEC::InstanceType::M8gbMedium
      when "m8gb.xlarge"          then AEC::InstanceType::M8gbXlarge
      when "m8gb.48xlarge"        then AEC::InstanceType::M8gb48xlarge
      when "m8gb.metal-24xl"      then AEC::InstanceType::M8gbMetal24xl
      when "m8gb.metal-48xl"      then AEC::InstanceType::M8gbMetal48xl
      when "m8gn.12xlarge"        then AEC::InstanceType::M8gn12xlarge
      when "m8gn.16xlarge"        then AEC::InstanceType::M8gn16xlarge
      when "m8gn.24xlarge"        then AEC::InstanceType::M8gn24xlarge
      when "m8gn.2xlarge"         then AEC::InstanceType::M8gn2xlarge
      when "m8gn.48xlarge"        then AEC::InstanceType::M8gn48xlarge
      when "m8gn.4xlarge"         then AEC::InstanceType::M8gn4xlarge
      when "m8gn.8xlarge"         then AEC::InstanceType::M8gn8xlarge
      when "m8gn.large"           then AEC::InstanceType::M8gnLarge
      when "m8gn.medium"          then AEC::InstanceType::M8gnMedium
      when "m8gn.xlarge"          then AEC::InstanceType::M8gnXlarge
      when "m8gn.metal-24xl"      then AEC::InstanceType::M8gnMetal24xl
      when "m8gn.metal-48xl"      then AEC::InstanceType::M8gnMetal48xl
      when "x8aedz.12xlarge"      then AEC::InstanceType::X8aedz12xlarge
      when "x8aedz.24xlarge"      then AEC::InstanceType::X8aedz24xlarge
      when "x8aedz.3xlarge"       then AEC::InstanceType::X8aedz3xlarge
      when "x8aedz.6xlarge"       then AEC::InstanceType::X8aedz6xlarge
      when "x8aedz.large"         then AEC::InstanceType::X8aedzLarge
      when "x8aedz.metal-12xl"    then AEC::InstanceType::X8aedzMetal12xl
      when "x8aedz.metal-24xl"    then AEC::InstanceType::X8aedzMetal24xl
      when "x8aedz.xlarge"        then AEC::InstanceType::X8aedzXlarge
      when "m8azn.medium"         then AEC::InstanceType::M8aznMedium
      when "m8azn.large"          then AEC::InstanceType::M8aznLarge
      when "m8azn.xlarge"         then AEC::InstanceType::M8aznXlarge
      when "m8azn.3xlarge"        then AEC::InstanceType::M8azn3xlarge
      when "m8azn.6xlarge"        then AEC::InstanceType::M8azn6xlarge
      when "m8azn.12xlarge"       then AEC::InstanceType::M8azn12xlarge
      when "m8azn.24xlarge"       then AEC::InstanceType::M8azn24xlarge
      when "m8azn.metal-12xl"     then AEC::InstanceType::M8aznMetal12xl
      when "m8azn.metal-24xl"     then AEC::InstanceType::M8aznMetal24xl
      when "x8i.large"            then AEC::InstanceType::X8iLarge
      when "x8i.xlarge"           then AEC::InstanceType::X8iXlarge
      when "x8i.2xlarge"          then AEC::InstanceType::X8i2xlarge
      when "x8i.4xlarge"          then AEC::InstanceType::X8i4xlarge
      when "x8i.8xlarge"          then AEC::InstanceType::X8i8xlarge
      when "x8i.12xlarge"         then AEC::InstanceType::X8i12xlarge
      when "x8i.16xlarge"         then AEC::InstanceType::X8i16xlarge
      when "x8i.24xlarge"         then AEC::InstanceType::X8i24xlarge
      when "x8i.32xlarge"         then AEC::InstanceType::X8i32xlarge
      when "x8i.48xlarge"         then AEC::InstanceType::X8i48xlarge
      when "x8i.64xlarge"         then AEC::InstanceType::X8i64xlarge
      when "x8i.96xlarge"         then AEC::InstanceType::X8i96xlarge
      when "x8i.metal-48xl"       then AEC::InstanceType::X8iMetal48xl
      when "x8i.metal-96xl"       then AEC::InstanceType::X8iMetal96xl
      when "mac-m4max.metal"      then AEC::InstanceType::MacM4maxMetal
      when "g7e.2xlarge"          then AEC::InstanceType::G7e2xlarge
      when "g7e.4xlarge"          then AEC::InstanceType::G7e4xlarge
      when "g7e.8xlarge"          then AEC::InstanceType::G7e8xlarge
      when "g7e.12xlarge"         then AEC::InstanceType::G7e12xlarge
      when "g7e.24xlarge"         then AEC::InstanceType::G7e24xlarge
      when "g7e.48xlarge"         then AEC::InstanceType::G7e48xlarge
      when "r8id.large"           then AEC::InstanceType::R8idLarge
      when "r8id.xlarge"          then AEC::InstanceType::R8idXlarge
      when "r8id.2xlarge"         then AEC::InstanceType::R8id2xlarge
      when "r8id.4xlarge"         then AEC::InstanceType::R8id4xlarge
      when "r8id.8xlarge"         then AEC::InstanceType::R8id8xlarge
      when "r8id.12xlarge"        then AEC::InstanceType::R8id12xlarge
      when "r8id.16xlarge"        then AEC::InstanceType::R8id16xlarge
      when "r8id.24xlarge"        then AEC::InstanceType::R8id24xlarge
      when "r8id.32xlarge"        then AEC::InstanceType::R8id32xlarge
      when "r8id.48xlarge"        then AEC::InstanceType::R8id48xlarge
      when "r8id.96xlarge"        then AEC::InstanceType::R8id96xlarge
      when "r8id.metal-48xl"      then AEC::InstanceType::R8idMetal48xl
      when "r8id.metal-96xl"      then AEC::InstanceType::R8idMetal96xl
      when "c8id.large"           then AEC::InstanceType::C8idLarge
      when "c8id.xlarge"          then AEC::InstanceType::C8idXlarge
      when "c8id.2xlarge"         then AEC::InstanceType::C8id2xlarge
      when "c8id.4xlarge"         then AEC::InstanceType::C8id4xlarge
      when "c8id.8xlarge"         then AEC::InstanceType::C8id8xlarge
      when "c8id.12xlarge"        then AEC::InstanceType::C8id12xlarge
      when "c8id.16xlarge"        then AEC::InstanceType::C8id16xlarge
      when "c8id.24xlarge"        then AEC::InstanceType::C8id24xlarge
      when "c8id.32xlarge"        then AEC::InstanceType::C8id32xlarge
      when "c8id.48xlarge"        then AEC::InstanceType::C8id48xlarge
      when "c8id.96xlarge"        then AEC::InstanceType::C8id96xlarge
      when "c8id.metal-48xl"      then AEC::InstanceType::C8idMetal48xl
      when "c8id.metal-96xl"      then AEC::InstanceType::C8idMetal96xl
      when "m8id.large"           then AEC::InstanceType::M8idLarge
      when "m8id.xlarge"          then AEC::InstanceType::M8idXlarge
      when "m8id.2xlarge"         then AEC::InstanceType::M8id2xlarge
      when "m8id.4xlarge"         then AEC::InstanceType::M8id4xlarge
      when "m8id.8xlarge"         then AEC::InstanceType::M8id8xlarge
      when "m8id.12xlarge"        then AEC::InstanceType::M8id12xlarge
      when "m8id.16xlarge"        then AEC::InstanceType::M8id16xlarge
      when "m8id.24xlarge"        then AEC::InstanceType::M8id24xlarge
      when "m8id.32xlarge"        then AEC::InstanceType::M8id32xlarge
      when "m8id.48xlarge"        then AEC::InstanceType::M8id48xlarge
      when "m8id.96xlarge"        then AEC::InstanceType::M8id96xlarge
      when "m8id.metal-48xl"      then AEC::InstanceType::M8idMetal48xl
      when "m8id.metal-96xl"      then AEC::InstanceType::M8idMetal96xl
      when "hpc8a.96xlarge"       then AEC::InstanceType::Hpc8a96xlarge
      when "c8in.large"           then AEC::InstanceType::C8inLarge
      when "c8in.xlarge"          then AEC::InstanceType::C8inXlarge
      when "c8in.2xlarge"         then AEC::InstanceType::C8in2xlarge
      when "c8in.4xlarge"         then AEC::InstanceType::C8in4xlarge
      when "c8in.8xlarge"         then AEC::InstanceType::C8in8xlarge
      when "c8in.12xlarge"        then AEC::InstanceType::C8in12xlarge
      when "c8in.16xlarge"        then AEC::InstanceType::C8in16xlarge
      when "c8in.24xlarge"        then AEC::InstanceType::C8in24xlarge
      when "c8in.32xlarge"        then AEC::InstanceType::C8in32xlarge
      when "c8in.48xlarge"        then AEC::InstanceType::C8in48xlarge
      when "c8in.96xlarge"        then AEC::InstanceType::C8in96xlarge
      when "c8in.metal-48xl"      then AEC::InstanceType::C8inMetal48xl
      when "c8in.metal-96xl"      then AEC::InstanceType::C8inMetal96xl
      when "c8ib.large"           then AEC::InstanceType::C8ibLarge
      when "c8ib.xlarge"          then AEC::InstanceType::C8ibXlarge
      when "c8ib.2xlarge"         then AEC::InstanceType::C8ib2xlarge
      when "c8ib.4xlarge"         then AEC::InstanceType::C8ib4xlarge
      when "c8ib.8xlarge"         then AEC::InstanceType::C8ib8xlarge
      when "c8ib.12xlarge"        then AEC::InstanceType::C8ib12xlarge
      when "c8ib.16xlarge"        then AEC::InstanceType::C8ib16xlarge
      when "c8ib.24xlarge"        then AEC::InstanceType::C8ib24xlarge
      when "c8ib.32xlarge"        then AEC::InstanceType::C8ib32xlarge
      when "c8ib.48xlarge"        then AEC::InstanceType::C8ib48xlarge
      when "c8ib.96xlarge"        then AEC::InstanceType::C8ib96xlarge
      when "c8ib.metal-48xl"      then AEC::InstanceType::C8ibMetal48xl
      when "c8ib.metal-96xl"      then AEC::InstanceType::C8ibMetal96xl
      when "r8in.large"           then AEC::InstanceType::R8inLarge
      when "r8in.xlarge"          then AEC::InstanceType::R8inXlarge
      when "r8in.2xlarge"         then AEC::InstanceType::R8in2xlarge
      when "r8in.4xlarge"         then AEC::InstanceType::R8in4xlarge
      when "r8in.8xlarge"         then AEC::InstanceType::R8in8xlarge
      when "r8in.12xlarge"        then AEC::InstanceType::R8in12xlarge
      when "r8in.16xlarge"        then AEC::InstanceType::R8in16xlarge
      when "r8in.24xlarge"        then AEC::InstanceType::R8in24xlarge
      when "r8in.32xlarge"        then AEC::InstanceType::R8in32xlarge
      when "r8in.48xlarge"        then AEC::InstanceType::R8in48xlarge
      when "r8in.96xlarge"        then AEC::InstanceType::R8in96xlarge
      when "r8ib.large"           then AEC::InstanceType::R8ibLarge
      when "r8ib.xlarge"          then AEC::InstanceType::R8ibXlarge
      when "r8ib.2xlarge"         then AEC::InstanceType::R8ib2xlarge
      when "r8ib.4xlarge"         then AEC::InstanceType::R8ib4xlarge
      when "r8ib.8xlarge"         then AEC::InstanceType::R8ib8xlarge
      when "r8ib.12xlarge"        then AEC::InstanceType::R8ib12xlarge
      when "r8ib.16xlarge"        then AEC::InstanceType::R8ib16xlarge
      when "r8ib.24xlarge"        then AEC::InstanceType::R8ib24xlarge
      when "r8ib.32xlarge"        then AEC::InstanceType::R8ib32xlarge
      when "r8ib.48xlarge"        then AEC::InstanceType::R8ib48xlarge
      when "r8ib.96xlarge"        then AEC::InstanceType::R8ib96xlarge
      when "m8in.large"           then AEC::InstanceType::M8inLarge
      when "m8in.xlarge"          then AEC::InstanceType::M8inXlarge
      when "m8in.2xlarge"         then AEC::InstanceType::M8in2xlarge
      when "m8in.4xlarge"         then AEC::InstanceType::M8in4xlarge
      when "m8in.8xlarge"         then AEC::InstanceType::M8in8xlarge
      when "m8in.12xlarge"        then AEC::InstanceType::M8in12xlarge
      when "m8in.16xlarge"        then AEC::InstanceType::M8in16xlarge
      when "m8in.24xlarge"        then AEC::InstanceType::M8in24xlarge
      when "m8in.32xlarge"        then AEC::InstanceType::M8in32xlarge
      when "m8in.48xlarge"        then AEC::InstanceType::M8in48xlarge
      when "m8in.96xlarge"        then AEC::InstanceType::M8in96xlarge
      when "m8ib.large"           then AEC::InstanceType::M8ibLarge
      when "m8ib.xlarge"          then AEC::InstanceType::M8ibXlarge
      when "m8ib.2xlarge"         then AEC::InstanceType::M8ib2xlarge
      when "m8ib.4xlarge"         then AEC::InstanceType::M8ib4xlarge
      when "m8ib.8xlarge"         then AEC::InstanceType::M8ib8xlarge
      when "m8ib.12xlarge"        then AEC::InstanceType::M8ib12xlarge
      when "m8ib.16xlarge"        then AEC::InstanceType::M8ib16xlarge
      when "m8ib.24xlarge"        then AEC::InstanceType::M8ib24xlarge
      when "m8ib.32xlarge"        then AEC::InstanceType::M8ib32xlarge
      when "m8ib.48xlarge"        then AEC::InstanceType::M8ib48xlarge
      when "m8ib.96xlarge"        then AEC::InstanceType::M8ib96xlarge
      when "m8ine.large"          then AEC::InstanceType::M8ineLarge
      when "m8ine.xlarge"         then AEC::InstanceType::M8ineXlarge
      when "m8ine.2xlarge"        then AEC::InstanceType::M8ine2xlarge
      when "m8ine.4xlarge"        then AEC::InstanceType::M8ine4xlarge
      when "m8ine.8xlarge"        then AEC::InstanceType::M8ine8xlarge
      when "m8ine.12xlarge"       then AEC::InstanceType::M8ine12xlarge
      when "c8ine.large"          then AEC::InstanceType::C8ineLarge
      when "c8ine.xlarge"         then AEC::InstanceType::C8ineXlarge
      when "c8ine.2xlarge"        then AEC::InstanceType::C8ine2xlarge
      when "c8ine.4xlarge"        then AEC::InstanceType::C8ine4xlarge
      when "c8ine.8xlarge"        then AEC::InstanceType::C8ine8xlarge
      when "c8ine.12xlarge"       then AEC::InstanceType::C8ine12xlarge
      when "m8idn.large"          then AEC::InstanceType::M8idnLarge
      when "m8idn.xlarge"         then AEC::InstanceType::M8idnXlarge
      when "m8idn.2xlarge"        then AEC::InstanceType::M8idn2xlarge
      when "m8idn.4xlarge"        then AEC::InstanceType::M8idn4xlarge
      when "m8idn.8xlarge"        then AEC::InstanceType::M8idn8xlarge
      when "m8idn.12xlarge"       then AEC::InstanceType::M8idn12xlarge
      when "m8idn.16xlarge"       then AEC::InstanceType::M8idn16xlarge
      when "m8idn.24xlarge"       then AEC::InstanceType::M8idn24xlarge
      when "m8idn.32xlarge"       then AEC::InstanceType::M8idn32xlarge
      when "m8idn.48xlarge"       then AEC::InstanceType::M8idn48xlarge
      when "m8idn.96xlarge"       then AEC::InstanceType::M8idn96xlarge
      when "r8idn.large"          then AEC::InstanceType::R8idnLarge
      when "r8idn.xlarge"         then AEC::InstanceType::R8idnXlarge
      when "r8idn.2xlarge"        then AEC::InstanceType::R8idn2xlarge
      when "r8idn.4xlarge"        then AEC::InstanceType::R8idn4xlarge
      when "r8idn.8xlarge"        then AEC::InstanceType::R8idn8xlarge
      when "r8idn.12xlarge"       then AEC::InstanceType::R8idn12xlarge
      when "r8idn.16xlarge"       then AEC::InstanceType::R8idn16xlarge
      when "r8idn.24xlarge"       then AEC::InstanceType::R8idn24xlarge
      when "r8idn.32xlarge"       then AEC::InstanceType::R8idn32xlarge
      when "r8idn.48xlarge"       then AEC::InstanceType::R8idn48xlarge
      when "r8idn.96xlarge"       then AEC::InstanceType::R8idn96xlarge
      when "m8idb.large"          then AEC::InstanceType::M8idbLarge
      when "m8idb.xlarge"         then AEC::InstanceType::M8idbXlarge
      when "m8idb.2xlarge"        then AEC::InstanceType::M8idb2xlarge
      when "m8idb.4xlarge"        then AEC::InstanceType::M8idb4xlarge
      when "m8idb.8xlarge"        then AEC::InstanceType::M8idb8xlarge
      when "m8idb.12xlarge"       then AEC::InstanceType::M8idb12xlarge
      when "m8idb.16xlarge"       then AEC::InstanceType::M8idb16xlarge
      when "m8idb.24xlarge"       then AEC::InstanceType::M8idb24xlarge
      when "m8idb.32xlarge"       then AEC::InstanceType::M8idb32xlarge
      when "m8idb.48xlarge"       then AEC::InstanceType::M8idb48xlarge
      when "m8idb.96xlarge"       then AEC::InstanceType::M8idb96xlarge
      when "r8idb.large"          then AEC::InstanceType::R8idbLarge
      when "r8idb.xlarge"         then AEC::InstanceType::R8idbXlarge
      when "r8idb.2xlarge"        then AEC::InstanceType::R8idb2xlarge
      when "r8idb.4xlarge"        then AEC::InstanceType::R8idb4xlarge
      when "r8idb.8xlarge"        then AEC::InstanceType::R8idb8xlarge
      when "r8idb.12xlarge"       then AEC::InstanceType::R8idb12xlarge
      when "r8idb.16xlarge"       then AEC::InstanceType::R8idb16xlarge
      when "r8idb.24xlarge"       then AEC::InstanceType::R8idb24xlarge
      when "r8idb.32xlarge"       then AEC::InstanceType::R8idb32xlarge
      when "r8idb.48xlarge"       then AEC::InstanceType::R8idb48xlarge
      when "r8idb.96xlarge"       then AEC::InstanceType::R8idb96xlarge
      when "mac-m3ultra.metal"    then AEC::InstanceType::MacM3ultraMetal
      when "m9g.large"            then AEC::InstanceType::M9gLarge
      when "m9g.xlarge"           then AEC::InstanceType::M9gXlarge
      when "m9g.2xlarge"          then AEC::InstanceType::M9g2xlarge
      when "m9g.4xlarge"          then AEC::InstanceType::M9g4xlarge
      when "m9g.8xlarge"          then AEC::InstanceType::M9g8xlarge
      when "m9g.12xlarge"         then AEC::InstanceType::M9g12xlarge
      when "m9g.16xlarge"         then AEC::InstanceType::M9g16xlarge
      when "m9g.24xlarge"         then AEC::InstanceType::M9g24xlarge
      when "m9g.48xlarge"         then AEC::InstanceType::M9g48xlarge
      when "m9g.metal-24xl"       then AEC::InstanceType::M9gMetal24xl
      when "m9g.metal-48xl"       then AEC::InstanceType::M9gMetal48xl
      when "m9gd.large"           then AEC::InstanceType::M9gdLarge
      when "m9gd.xlarge"          then AEC::InstanceType::M9gdXlarge
      when "m9gd.2xlarge"         then AEC::InstanceType::M9gd2xlarge
      when "m9gd.4xlarge"         then AEC::InstanceType::M9gd4xlarge
      when "m9gd.8xlarge"         then AEC::InstanceType::M9gd8xlarge
      when "m9gd.12xlarge"        then AEC::InstanceType::M9gd12xlarge
      when "m9gd.16xlarge"        then AEC::InstanceType::M9gd16xlarge
      when "m9gd.24xlarge"        then AEC::InstanceType::M9gd24xlarge
      when "m9gd.48xlarge"        then AEC::InstanceType::M9gd48xlarge
      when "m9gd.metal-24xl"      then AEC::InstanceType::M9gdMetal24xl
      when "m9gd.metal-48xl"      then AEC::InstanceType::M9gdMetal48xl
      when "r8in.metal-48xl"      then AEC::InstanceType::R8inMetal48xl
      when "r8in.metal-96xl"      then AEC::InstanceType::R8inMetal96xl
      when "r8ib.metal-48xl"      then AEC::InstanceType::R8ibMetal48xl
      when "r8ib.metal-96xl"      then AEC::InstanceType::R8ibMetal96xl
      when "r8idn.metal-48xl"     then AEC::InstanceType::R8idnMetal48xl
      when "r8idn.metal-96xl"     then AEC::InstanceType::R8idnMetal96xl
      when "r8idb.metal-48xl"     then AEC::InstanceType::R8idbMetal48xl
      when "r8idb.metal-96xl"     then AEC::InstanceType::R8idbMetal96xl
      when "m8in.metal-48xl"      then AEC::InstanceType::M8inMetal48xl
      when "m8in.metal-96xl"      then AEC::InstanceType::M8inMetal96xl
      when "m8ib.metal-48xl"      then AEC::InstanceType::M8ibMetal48xl
      when "m8ib.metal-96xl"      then AEC::InstanceType::M8ibMetal96xl
      when "m8idn.metal-48xl"     then AEC::InstanceType::M8idnMetal48xl
      when "m8idn.metal-96xl"     then AEC::InstanceType::M8idnMetal96xl
      when "m8idb.metal-48xl"     then AEC::InstanceType::M8idbMetal48xl
      when "m8idb.metal-96xl"     then AEC::InstanceType::M8idbMetal96xl
      when "g7.2xlarge"           then AEC::InstanceType::G72xlarge
      when "g7.4xlarge"           then AEC::InstanceType::G74xlarge
      when "g7.8xlarge"           then AEC::InstanceType::G78xlarge
      when "g7.12xlarge"          then AEC::InstanceType::G712xlarge
      when "g7.24xlarge"          then AEC::InstanceType::G724xlarge
      when "g7.48xlarge"          then AEC::InstanceType::G748xlarge
      when "c9g.medium"           then AEC::InstanceType::C9gMedium
      when "c9g.large"            then AEC::InstanceType::C9gLarge
      when "c9g.xlarge"           then AEC::InstanceType::C9gXlarge
      when "c9g.2xlarge"          then AEC::InstanceType::C9g2xlarge
      when "c9g.4xlarge"          then AEC::InstanceType::C9g4xlarge
      when "c9g.8xlarge"          then AEC::InstanceType::C9g8xlarge
      when "c9g.12xlarge"         then AEC::InstanceType::C9g12xlarge
      when "c9g.16xlarge"         then AEC::InstanceType::C9g16xlarge
      when "c9g.24xlarge"         then AEC::InstanceType::C9g24xlarge
      when "c9g.48xlarge"         then AEC::InstanceType::C9g48xlarge
      when "c9g.metal-48xl"       then AEC::InstanceType::C9gMetal48xl
      when "c9gd.medium"          then AEC::InstanceType::C9gdMedium
      when "c9gd.large"           then AEC::InstanceType::C9gdLarge
      when "c9gd.xlarge"          then AEC::InstanceType::C9gdXlarge
      when "c9gd.2xlarge"         then AEC::InstanceType::C9gd2xlarge
      when "c9gd.4xlarge"         then AEC::InstanceType::C9gd4xlarge
      when "c9gd.8xlarge"         then AEC::InstanceType::C9gd8xlarge
      when "c9gd.12xlarge"        then AEC::InstanceType::C9gd12xlarge
      when "c9gd.16xlarge"        then AEC::InstanceType::C9gd16xlarge
      when "c9gd.24xlarge"        then AEC::InstanceType::C9gd24xlarge
      when "c9gd.48xlarge"        then AEC::InstanceType::C9gd48xlarge
      when "c9gd.metal-48xl"      then AEC::InstanceType::C9gdMetal48xl
      else
        nil
      end
    end
  end
end
