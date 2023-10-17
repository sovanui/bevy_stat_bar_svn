#import bevy_pbr::mesh_vertex_output MeshVertexOutput

struct CustomMaterial {
    foreground_color: vec4<f32>,
    background_color: vec4<f32>,
    percent: f32,
};

@group(1) @binding(0) var<uniform> material: CustomMaterial;

@fragment
fn fragment(mesh: MeshVertexOutput) -> @location(0) vec4<f32> {
    if (mesh.uv.x <= material.percent) {
        return material.foreground_color;
    } else {
        return material.background_color;
    }
}