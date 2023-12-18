local Functions = {
	["checkcaller"] = checkcaller,
	["fireclickdetector"] = fireclickdetector or click_detector,
	["getconstants"] = getconstants or (debug and debug.getconstants),
	["getgc"] = getgc or get_gc_objects,
	["getgenv"] = getgenv or (getrawmetatable and function()
		return getrawmetatable(getfenv()).__index
	end),
	["getinfo"] = getinfo or (debug and debug.getinfo),
	["getnamecallmethod"] = getnamecallmethod or get_namecall_method,
	["getproto"] = getproto or (debug and debug.getproto),
	["getprotos"] = getprotos or (debug and debug.getprotos),
	["getrenv"] = getrenv or (getrawmetatable and function()
		return getrawmetatable(getfenv()).__index
	end),
	["getsenv"] = getsenv or (getreg and function(scr)
		for i, v in next, getreg() do
			if type(v) == "function" and getfenv(v).script == scr then
				return getfenv(v)
			end
		end
	end),
	["getrawmetatable"] = getrawmetatable,
	["getthreadidentity"] = getidentity or getthreadidentity or get_thread_identity or getcontext or getthreadcontext or get_thread_context or (syn and syn.get_thread_identity),
	["getupvalue"] = getupvalue or (debug and debug.getupvalue),
	["getupvalues"] = getupvalues or (debug and debug.getupvalues),
	["hookfunction"] = hookfunction or hookfunc or detour_function or replaceclosure,
	["isexploitfunction"] = is_synapse_function or is_protosmasher_closure or is_sirhurt_closure or issentinelclosure or iselectronfunction or iskrnlclosure or checkclosure,
	["isfile"] = isfile or is_file or file_exists or fileexists or (readfile and function(path)
		local succ, res = pcall(readfile, path)
		return succ
	end),
	["islclosure"] = islclosure or is_l_closure,
	["makereadonly"] = make_readonly or (setreadonly and function(tab)
		setreadonly(tab, true)
	end),
	["makewriteable"] = make_writeable or make_writable or (setreadonly and function(tab)
		setreadonly(tab, false)
	end),
	["newcclosure"] = newcclosure or new_c_closure,
	["newdrawing"] = (Drawing and Drawing.new) or (Drawing and Drawing.New),
	["readfile"] = readfile or read_file or fread,
	["request"] = request or httprequest or http_request or (syn and syn.request),
	["require"] = require,
	["setconstant"] = setconstant or (debug and debug.setconstant),
	["setthreadidentity"] = setidentity or setthreadidentity or set_thread_identity or setcontext or setthreadcontext or set_thread_context or (syn and syn.set_thread_identity),
	["setupvalue"] = setupvalue or (debug and debug.setupvalue),
	["traceback"] = (debug and debug.traceback),
	["writefile"] = writefile or write_file or fwrite,
	["httprequest"] = request,
}

for index, value in Functions do
    if getgenv()[index] == nil then
        getgenv()[index] = value
    end
end
