import type { Prisma } from '@prisma/client'

export default defineEventHandler(async (event) => {

    console.log(`api is called!!${process.server ? '(server)' : '(client)'}`);

    const where: Prisma.MaterialWhereInput = {};

    // クエリの取得
    const query = getQuery(event)

    if (query.q && typeof query.q === 'string') {
        where.name = {
            contains: query.q
        }
    }

    // dbからmaterialを取得
    const materials = await prisma.material.findMany({
        where,
        include: {
            details: true,
            children: true,
        }
    });

    return materials;
})