const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const upstream = b.dependency("upstream", .{});

    const lib = b.addLibrary(.{
        .name = "isocline",
        .linkage = .static,
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    lib.addCSourceFile(.{
        .file = upstream.path("src/isocline.c"),
        .flags = &.{},
    });
    lib.installHeader(upstream.path("include/isocline.h"), "isocline.h");

    b.installArtifact(lib);
}
