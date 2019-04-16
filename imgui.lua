-- scaffold geniefile for imgui

imgui_script = path.getabsolute(path.getdirectory(_SCRIPT))
imgui_root = path.join(imgui_script, "imgui")

imgui_includedirs = {
	path.join(imgui_script, "config"),
	imgui_root,
}

imgui_libdirs = {}
imgui_links = {}
imgui_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { imgui_includedirs }
	end,

	_add_defines = function()
		defines { imgui_defines }
	end,

	_add_libdirs = function()
		libdirs { imgui_libdirs }
	end,

	_add_external_links = function()
		links { imgui_links }
	end,

	_add_self_links = function()
		links { "imgui" }
	end,

	_create_projects = function()

project "imgui"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		imgui_includedirs,
	}

	defines {}

	files {
		path.join(imgui_script, "config", "**.h"),
		path.join(imgui_root, "**.h"),
		path.join(imgui_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
