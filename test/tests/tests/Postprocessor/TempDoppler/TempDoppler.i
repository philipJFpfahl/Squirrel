[Mesh]
  type = GeneratedMesh
  dim = 1
  xmin = 0
  xmax = 1
  nx = 10
[]

[Variables]
  [C]
  []
[]


[AuxVariables]
  [flux]
  []
  [T]
  []
  [T_ref]
  []
  [T_x]
  []
[]

[ICs]
  [flux]
    type = FunctionIC
    variable = flux
    function = '1'
  []
  [T]
    type = FunctionIC
    variable = T
    function = '2'
  []
  [T_ref]
    type = FunctionIC
    variable = T_ref
    function = '0'
  []
  [T_x]
    type = FunctionIC
    variable = T_x
    function = 'x'
  []
[]

[Kernels]
  [C_time]
    type = NullKernel
    variable = C
  []
[]

[Executioner]
  type = Steady
[]

[Outputs]
  exodus = true
  [outfile]
    type = CSV
    delimiter = ' '
  []
[]


[Postprocessors]
  [Temp_feedback_0]
      type = TempDoppler
      variable = T
      flux = flux
      adjflux = flux
      T_ref = T_ref
      a=0
  []
  [Temp_feedback_1]
      type = TempDoppler
      variable = T
      flux = flux
      adjflux = flux
      T_ref = T_ref
      b = 0
      c = 1
      d = 1 
  []
  [Temp_feedback_2]
      type = TempDoppler
      variable = T
      flux = flux
      adjflux = flux
      T_ref = T_ref
  []
  [Temp_feedback_3]
      type = TempDoppler
      variable = T_x
      flux = flux
      adjflux = flux
      T_ref = T_ref
  []
[]
