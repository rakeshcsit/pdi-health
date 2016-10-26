module ApplicationHelper

  def eqh key, val
    a = Audit.new
    if a.exact_check(key, val)
      "optimal"
    else
      "notOptimal"
    end
  end

  def alh key, val
    a = Audit.new
    if a.at_least_check(key, val)
      "optimal"
    else
      "notOptimal"
    end
  end

  def lph p
    a = Audit.new
    if a.for_percent_lp(p)
      "optimal"
    else
      "notOptimal"
    end
  end

end
