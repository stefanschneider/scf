# -*- coding: utf-8 -*-
## Common functionality for all providers.
# # ## ### ##### ########

# Common functionality for all providers.
class Common
  # # ## ### ##### ########
  ## Common status (options and derived DTR information)

  def initialize(options)
    @options = options
    initialize_dtr_information
  end

  def initialize_dtr_information
    # Get options, set defaults for missing parts
    @dtr         = @options[:dtr] || 'docker.helion.lol'
    @dtr_org     = @options[:dtr_org] || 'helioncf'
    @hcf_version = @options[:hcf_version] || 'develop'
    @hcf_prefix  = @options[:hcf_prefix] || 'hcf'
  end

  # # ## ### ##### ########
  ## Predicates on roles.

  def dev?(role)
    role['dev-only'] && !@options[:dev]
  end

  def typeof(role)
    role['type'] || 'bosh'
  end

  def job?(role)
    t_job?(typeof(role))
  end

  def task?(role)
    t_task?(typeof(role))
  end

  # # ## ### ##### ########
  ## Predicates on role types

  def t_job?(type)
    type == 'bosh' || type == 'docker'
  end

  def t_task?(type)
    type == 'bosh-task'
  end

  def t_bosh?(type)
    type == 'bosh' || type == 'bosh-task'
  end

  def t_docker?(type)
    type == 'docker'
  end

  # # ## ### ##### ########
end
