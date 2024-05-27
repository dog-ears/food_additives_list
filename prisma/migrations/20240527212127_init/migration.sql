-- CreateTable
CREATE TABLE "Material" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "japan" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Detail" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "use" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "other_name" TEXT NOT NULL,
    "ins_number" TEXT NOT NULL,
    "item_number" TEXT NOT NULL,
    "function" TEXT NOT NULL,
    "standard_for_use" TEXT NOT NULL,
    "url_for_use" TEXT NOT NULL,
    "standard_for_component" TEXT NOT NULL,
    "url_for_component" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL,
    "updated_at" DATETIME NOT NULL,
    "material_id" INTEGER NOT NULL,
    CONSTRAINT "Detail_material_id_fkey" FOREIGN KEY ("material_id") REFERENCES "Material" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
