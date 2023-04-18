import React, { ReactNode } from 'react';

import { ThemeIcons } from '@scalr/react/theme';
import { classNames } from '@scalr/react/utils/classNames';
import { Icon } from '@scalr/react/components/Icon';

import styles from './style.pcss';

export enum BannerStatus {
    info,
    success,
    warning,
    error,
}

export enum BannerType {
    small,
    large,
    snackbar,
}

const iconMap = {
    [BannerType.small]: {
        [BannerStatus.info]: ThemeIcons.info,
        [BannerStatus.success]: ThemeIcons.checkedXs,
        [BannerStatus.warning]: ThemeIcons.errorBorder,
        [BannerStatus.error]: ThemeIcons.errorBorder,
    },
    // TODO: change images to real
    [BannerType.large]: {
        [BannerStatus.info]: ThemeIcons.info,
        [BannerStatus.success]: ThemeIcons.checkedXs,
        [BannerStatus.warning]: ThemeIcons.errorBorder,
        [BannerStatus.error]: ThemeIcons.errorBorder,
    },
    [BannerType.snackbar]: {
        [BannerStatus.info]: ThemeIcons.info,
        [BannerStatus.success]: ThemeIcons.checkedXs,
        [BannerStatus.warning]: ThemeIcons.errorBorder,
        [BannerStatus.error]: ThemeIcons.errorBorder,
    },
};

export type BannerPropsType = {
    status: BannerStatus;
    type: BannerType;
    showIcon?: boolean;
    children: ReactNode | [ReactNode, ReactNode];
};

export const Banner = (props: React.PropsWithChildren<BannerPropsType>) => {
    const { status, type, showIcon = true, children } = props;
    const [firstChild, ...otherChildren] = React.Children.toArray(children);
    const classes = classNames(
        styles.banner,
        [styles.info, status === BannerStatus.info],
        [styles.success, status === BannerStatus.success],
        [styles.warning, status === BannerStatus.warning],
        [styles.error, status === BannerStatus.error],
        [styles.small, type === BannerType.small],
    );

    return (
        <div className={classes}>
            <div className={styles.bodyContainer}>
                {showIcon && <Icon icon={iconMap[type][status]} className={styles.icon} />}
                <div className={styles.infoContainer}>{firstChild}</div>
            </div>
            {otherChildren.length > 0 && (
                <div className={styles.actions}>
                    {otherChildren}
                </div>
            )}
        </div>
    );
};
