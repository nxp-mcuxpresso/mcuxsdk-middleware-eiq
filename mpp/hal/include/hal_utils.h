/*
 * Copyright 2022-2024 NXP.
 * NXP Confidential and Proprietary.
 * This software is owned or controlled by NXP and may only be used strictly in
 * accordance with the applicable license terms. By expressly accepting such
 * terms or by downloading, installing, activating and/or otherwise using
 * the software, you are agreeing that you have read, and that you agree to
 * comply with and are bound by, such license terms. If you do not agree to be
 * bound by the applicable license terms, then you may not retain, install,
 * activate or otherwise use the software.
 */

#ifndef HAL_UTILS_H_
#define HAL_UTILS_H_

/*! \addtogroup HAL_TYPES
*  @{
*/

#include "hal_camera_dev.h"
#include "hal_display_dev.h"
#include "hal_static_image.h"
#include "hal_graphics_dev.h"

/** graphics setup */
typedef int (*graphic_setup_func_t) (gfx_dev_t *);
typedef struct
{
    const char* gfx_dev_name;
    graphic_setup_func_t gfx_setup_func;
} hal_graphics_setup_t;

/** display setup */
typedef int (*display_setup_func_t) (display_dev_t *);
typedef struct
{
    const char* display_name;
    display_setup_func_t display_setup_func;
} hal_display_setup_t;

/** camera setup */
typedef int (*camera_setup_func_t)(const char *, camera_dev_t *);

typedef struct
{
    const char* camera_name;
    camera_setup_func_t camera_setup_func;
} hal_camera_setup_t;

int setup_static_image_elt(static_image_t *elt);
uint32_t calc_checksum(int size_b, void *pbuf);

/** checksum calculation method */
typedef enum
{
    CHECKSUM_TYPE_PISANO,     /*!< checksum computed using Pisano */
    CHECKSUM_TYPE_CRC_ELCDIF, /*!< checksum computed CRC from ELCDIF */
} checksum_type_t;

/** computed checksum */
typedef struct
{
    checksum_type_t type;     /*!< checksum calculation method */
    uint32_t value;           /*!< checksum value */
} checksum_data_t;

/** @} */

/*! \addtogroup HAL_OPERATIONS
*  @{
*/

/** returns the number of bits per pixel per format, unknown format return 0 */
static inline int get_bitpp(mpp_pixel_format_t type)
{
    int ret;

    switch(type) {
    case MPP_PIXEL_ARGB:
    case MPP_PIXEL_BGRA:
    case MPP_PIXEL_RGBA:
    case MPP_PIXEL_YUYV:
    case MPP_PIXEL_GRAY888X:
    case MPP_PIXEL_YUV1P444:
        ret = 32;
        break;
    case MPP_PIXEL_RGB:
    case MPP_PIXEL_BGR:
    case MPP_PIXEL_GRAY888:
        ret = 24;
        break;
    case MPP_PIXEL_RGB565:
    case MPP_PIXEL_DEPTH16:
    case MPP_PIXEL_GRAY16:
    case MPP_PIXEL_UYVY1P422:
    case MPP_PIXEL_VYUY1P422:
        ret = 16;
        break;
    case MPP_PIXEL_GRAY:
    case MPP_PIXEL_DEPTH8:
        ret = 8;
        break;
    case MPP_PIXEL_YUV420P:
        ret = 12;
        break;
    case MPP_PIXEL_INVALID:
    default:
        ret = 0;
        break;
    }
    return ret;
}

/** Swaps a buffer's MSB and LSB bytes
 *  @param data: pointer to the buffer to be converted(from little endian to big endian and vice-versa).
 *  @param size: buffer size.
 *   */
void swap_2_bytes(uint8_t *data, int size);

/** @} */

#endif /* HAL_UTILS_H_ */
