export default defineEventHandler(async (event) => {

    // dbからmaterialを取得
    const materials = await prisma.material.findMany();

    return materials;
})