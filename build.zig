const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const upstream = b.dependency("upstream", .{});

    const isocline_mod = b.createModule(.{
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    isocline_mod.addCSourceFile(.{
        .file = upstream.path("src/isocline.c"),
        .flags = &.{},
    });

    const lib = b.addLibrary(.{
        .name = "isocline",
        .linkage = .static,
        .root_module = isocline_mod,
    });

    lib.installHeader(upstream.path("include/isocline.h"), "isocline.h");
    b.installArtifact(lib);
}
