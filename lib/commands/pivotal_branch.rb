require 'commands/pick'

module Commands::PivotalBranch
  BRANCH_REGEX = /^([a-zA-Z]+)\/(\d+)-(\w+)-(.+)$/
  BRANCH_REGEX_ID = 2
  BRANCH_REGEX_TYPE = 3
  
  private

  def type_options
    return options[story_type.to_sym] || {}
  end
  
  def story_type
    if m = current_branch.match(BRANCH_REGEX)
      branch_suffix = m[BRANCH_REGEX_TYPE]
      return Commands::Pick::Types.values.find{ |t| t.branch_suffix == branch_suffix }.type
    end
    return nil
  end
    
  def story_id
    return options[:story] if options.include? :story
    if m = current_branch.match(BRANCH_REGEX)
      return m[BRANCH_REGEX_ID]
    end
  end

  def fetch_story
    unless story_id
      raise "Branch name must contain a Pivotal Tracker story id"
    end

    project.stories.find(story_id)
  end
end