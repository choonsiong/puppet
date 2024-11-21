function hostname::environment(String $host) >> String {
  $env_name = $host ? {
    /[^\-]+-p-[^\-]+/ => 'Production',
    /[^\-]+-d-[^\-]+/ => 'Development',
    /[^\-]+-q-[^\-]+/ => 'QA',
  }

  $env_name
}
