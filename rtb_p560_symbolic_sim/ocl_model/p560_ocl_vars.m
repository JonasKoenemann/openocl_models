function p560_ocl_vars(vars)

  vars.addState('q', [1,6]);
  vars.addState('qd', [1,6]);
  
  vars.addAlgVar('qdd', [1,6]);
  
  vars.addControl('tau', [1,6]);

end