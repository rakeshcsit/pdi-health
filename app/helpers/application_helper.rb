module ApplicationHelper

  def awesome_choice a
    choice = a.give_comp
    if choice
      choice.capitalize
    else
      ""
    end
  end

  def format_lp_link l
    l.gsub('https://github.com/coding-boot-camp/FullStack-Lesson-Plans/tree/master/02-lesson-plans/', '')
  end

  def eqh key, val, bool
    a = Audit.new
    if a.exact_check(key, val)
      bool ? true : "optimal"
    else
      bool ? false : "notOptimal"
    end
  end

  def alh key, val, bool
    a = Audit.new
    if a.at_least_check(key, val)
      bool ? true : "optimal"
    else
      bool ? false : "notOptimal"
    end
  end

  def lph p, bool
    a = Audit.new
    if a.for_percent_lp(p)
      bool ? true : "optimal"
    else
      bool ? false : "notOptimal"
    end
  end

end
